package service

import (
	"errors"
	"server/app/api/request"
	"server/app/model/admins"
	"server/library/utils"

	"github.com/gogf/gf/frame/g"
	uuid "github.com/gogf/guuid"
	"github.com/mojocn/base64Captcha"
)

var Store = base64Captcha.DefaultMemStore

// AdminLogin Administrator login
// AdminLogin 管理员登录
func AdminLogin(l *request.AdminLogin) (data *admins.AdminHasOneAuthority, err error) {
	admin := (*admins.AdminHasOneAuthority)(nil) // 用法解释 https://goframe.org/database/gdb/chaining/select#tip4
	adminDb := g.DB("default").Table("admins").Safe()
	authorityDb := g.DB("default").Table("authorities").Safe()
	if err = adminDb.Where(g.Map{"username": l.Username}).Scan(&admin); err != nil {
		return admin, errors.New("用户不存在")
	}
	err = authorityDb.Where(g.Map{"authority_id": admin.AuthorityId}).Struct(&admin.Authority)
	if utils.CompareHashAndPassword(admin.Password, l.Password) { // 检查密码是否正确
		//err = authorityDb.Where(g.Map{"authority_id": admin.AuthorityId}).Scan(&admin.Authority)
		return admin, err
	}
	return admin, errors.New("密码错误")
}

// AdminRegister Administrator registration
// AdminRegister 管理员注册
func AdminRegister(r *request.AdminRegister) (err error) {
	if !admins.RecordNotFound(g.Map{"username": r.Username}) {
		return errors.New("用户已存在,注册失败")
	}
	u := &admins.Entity{
		Uuid:        uuid.New().String(),
		Username:    r.Username,
		Password:    r.Password,
		Nickname:    r.Nickname,
		HeaderImg:   r.HeaderImg,
		AuthorityId: r.AuthorityId,
	}
	if err = u.EncryptedPassword(); err != nil { // 哈希加密
		return errors.New("注册失败")
	}
	if _, err = admins.Insert(u); err != nil {
		return errors.New("注册失败")
	}
	return
}

// Captcha Verification code generation
// Captcha 验证码生成
func Captcha() (id string, b64s string, err error) {
	imgHeight := g.Cfg("captcha").GetInt("captcha.ImgHeight")
	imgWidth := g.Cfg("captcha").GetInt("captcha.ImgWidth")
	keyLong := g.Cfg("captcha").GetInt("captcha.KeyLong")
	driver := base64Captcha.NewDriverDigit(imgHeight, imgWidth, keyLong, 0.7, 80) // 字符,公式,验证码配置, 生成默认数字的driver
	cp := base64Captcha.NewCaptcha(driver, Store)
	id, b64s, err = cp.Generate()
	return id, b64s, err
}

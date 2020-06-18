package uniapp

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"gmanager/library/base"
)

type ArticleAction struct {
	base.BaseRouter
}

type Response struct {
	SessionKey string `form:"session_key",json:"session_key"`
	Openid     string `form:"openid",json:"openid"`
}

func (action *ArticleAction) Index(r *ghttp.Request) {
	form := base.NewForm(r.GetMap())
	db := g.DB()
	list, _ := db.GetOne("select * from waluduo_mp_wechat_config where id = ?", g.Slice{form.Config_id})
	base.Succ(r, g.Map{
		"post": list,
	})
	//if s, err := ghttp.Get("https://api.weixin.qq.com/sns/jscode2session?appid=" + configList.Appid + "&secret=" + configList.secret + "&js_code=" + form.Code + "&grant_type=authorization_code"); err != nil {
	//	glog.Error(err)
	//} else {
	//	//这个方法是将返回数据对应到struct
	//	//if j, errr := gjson.DecodeToJson(s.ReadAllString()); errr != nil {
	//	//	panic(errr)
	//	//} else {
	//	//	response := new(Response)
	//	//	if err := j.ToStruct(response); err != nil {
	//	//		panic(err)
	//	//	}
	//	//	base.Succ(r, g.Map{
	//	//		"post": form,
	//	//		"result": response,
	//	//	})
	//	//}
	//
	//	if p, e := gparser.LoadContent([]byte(s.ReadAllString())); e != nil {
	//		glog.Error(e)
	//	} else {
	//		pc := wxbizdatacrypt.WxBizDataCrypt{AppID: form.Appid, SessionKey: p.GetString("session_key")}
	//		result, errr := pc.Decrypt(form.EncryptedData, form.Iv, false) //第三个参数解释： 需要返回 JSON 数据类型时 使用 true, 需要返回 map 数据类型时 使用 false
	//		if errr != nil {
	//			glog.Error(errr)
	//		} else {
	//			base.Succ(r, g.Map{
	//				"post":   form,
	//				"result": result,
	//			})
	//		}
	//	}
	//	s.Close()
	//}
}

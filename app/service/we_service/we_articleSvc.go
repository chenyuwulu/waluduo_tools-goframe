package we_service

import (
	"errors"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
	"gmanager/app/model/waluduo_article"
	"gmanager/library"
	"gmanager/library/base"
)

// 请求参数
type Request struct {
	waluduo_article.Entity
	UserId int `form:"userId" json:"userId"`
}

// 保存实体
func Save(request *Request) (int64, error) {
	entity := (*waluduo_article.Entity)(nil)
	err := gconv.StructDeep(request.Entity, &entity)
	if err != nil {
		return 0, errors.New("数据错误")
	}

	entity.Createtime = library.GetNow()
	//// 根目录级别为1，其他为父节点 + 1
	//parentId := entity.ParentId
	//if parentId == 0 {
	//	entity.Level = 1
	//} else {
	//	form := base.NewForm(g.Map{"id": parentId})
	//	parentModel, err := GetOne(&form)
	//	if err != nil {
	//		return 0, err
	//	}
	//	entity.Level = parentModel.Level + 1
	//}

	// 判断新增还是修改
	r, err := waluduo_article.Model.Insert(entity)
	if err != nil {
		return 0, err
	}

	//_, _ = log.SaveLog(entity, constants.INSERT)
	return r.RowsAffected()
}

// 列表数据查询
func List(form *base.BaseForm) ([]*waluduo_article.Entity, error) {
	where := " 1 = 1 "
	var params []interface{}
	if form.Params != nil && form.Params["name"] != "" {
		where += " and name like ? "
		params = append(params, "%"+form.Params["name"]+"%")
	}
	if form.Params != nil && form.Params["level"] != "" {
		where += " and level in (?) "
		params = append(params, gstr.Split(form.Params["level"], ","))
	}
	if gstr.Trim(form.OrderBy) == "" {
		form.OrderBy = " createtime desc"
	}

	return waluduo_article.Model.Order(form.OrderBy).FindAll(where, params)
}
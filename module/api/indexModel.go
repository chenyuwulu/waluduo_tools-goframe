package api

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/glog"
	"gmanager/utils/base"
)

type WaluduoUser struct {
	// columns START
	Id           int    `json:"id" gconv:"id,omitempty"`                      // 主键
	Name         string `json:"name" gconv:"name,omitempty"`                  // 名称
	Kule         string `json:"kule" gconv:"kule,omitempty"`                  // 名称
	// columns END

	base.BaseModel
}

func (model WaluduoUser) Page(form *base.BaseForm) []WaluduoUser {
	//if form.Page <= 0 || form.Rows <= 0 {
	//	glog.Error(model.TableName()+" page param error", form.Page, form.Rows)
	//	return []WaluduoUser{}
	//}

	where := " 1 = 1 "
	var params []interface{}
	//if form.Params != nil {
	//	if form.Params["name"] != "" {
	//		where += " and name like ? "
	//		params = append(params, "%"+form.Params["name"]+"%")
	//	}
	//	if form.Params["key"] != "" {
	//		where += " and t.key like ? "
	//		params = append(params, "%"+form.Params["key"]+"%")
	//	}
	//	if gconv.Int(form.Params["parentId"]) > 0 {
	//		where += " and t.parent_id = ? "
	//		params = append(params, gconv.Int(form.Params["parentId"]))
	//	}
	//}
	//
	//num, err := model.dbModel("t").Where(where, params).Count()
	//form.TotalSize = num
	//form.TotalPage = num / form.Rows
	// 没有数据直接返回
	//if num == 0 {
	//	form.TotalPage = 0
	//	form.TotalSize = 0
	//	return []WaluduoUser{}
	//}

	var sss []WaluduoUser
	//pageNum, pageSize := (form.Page-1)*form.Rows, form.Rows
	dbModelss := model.dbModel("x").Fields(model.columnss())
	_ = dbModelss.Where(where, params).Structs(&sss)
	//if err != nil {
	//	glog.Error(model.TableName()+" page list error", err)
	//	return []WaluduoUser{}
	//}
	glog.Info("访问到了这里sss",sss)
	return sss
}

func (model WaluduoUser) dbModel(alias ...string) *gdb.Model {
	var tmpAlias string
	if len(alias) > 0 {
		tmpAlias = " " + alias[0]
	}
	tableModel := g.DB().Table(model.TableName() + tmpAlias).Safe()
	return tableModel
}

func (model WaluduoUser) TableName() string {
	return "waluduo_user"
}

func (model WaluduoUser) columnss() string {
	sqlColumns := "x.id as id,x.name as name,x.kule as kule"
	return sqlColumns
}
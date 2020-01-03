package api

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/util/gconv"
	"gmanager/utils/base"
)

type WaluduoUser struct {
	// columns START
	Id           int    `json:"id" gconv:"id,omitempty"`                      // 主键
	Name         string `json:"name" gconv:"name,omitempty"`                  // 名称
	// columns END

	base.BaseModel
}

func (model WaluduoUser) Page(form *base.BaseForm) []WaluduoUser {
	if form.Page <= 0 || form.Rows <= 0 {
		glog.Error(model.TableName()+" page param error", form.Page, form.Rows)
		return []WaluduoUser{}
	}

	where := " 1 = 1 "
	var params []interface{}
	if form.Params != nil {
		if form.Params["name"] != "" {
			where += " and name like ? "
			params = append(params, "%"+form.Params["name"]+"%")
		}
		if form.Params["key"] != "" {
			where += " and t.key like ? "
			params = append(params, "%"+form.Params["key"]+"%")
		}
		if gconv.Int(form.Params["parentId"]) > 0 {
			where += " and t.parent_id = ? "
			params = append(params, gconv.Int(form.Params["parentId"]))
		}
	}

	num, err := model.dbModel("t").Where(where, params).Count()
	form.TotalSize = num
	form.TotalPage = num / form.Rows

	// 没有数据直接返回
	if num == 0 {
		form.TotalPage = 0
		form.TotalSize = 0
		return []WaluduoUser{}
	}

	var resData []WaluduoUser
	pageNum, pageSize := (form.Page-1)*form.Rows, form.Rows
	dbModel := model.dbModel("t").Fields(model.columns() + ",su1.real_name as updateName,su2.real_name as createName")
	dbModel = dbModel.LeftJoin("sys_user su1", " t.update_id = su1.id ")
	dbModel = dbModel.LeftJoin("sys_user su2", " t.update_id = su2.id ")
	err = dbModel.Where(where, params).Limit(pageNum, pageSize).OrderBy(form.OrderBy).Structs(&resData)
	if err != nil {
		glog.Error(model.TableName()+" page list error", err)
		return []WaluduoUser{}
	}

	return resData
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
	return "sys_config"
}

func (model WaluduoUser) columns() string {
	sqlColumns := "t.id,t.name,t.key,t.value,t.code,t.data_type as dataType,t.parent_id as parentId,t.parent_key as parentKey,t.sort,t.project_id as projectId,t.copy_status as copyStatus,t.change_status as changeStatus,t.enable,t.update_time as updateTime,t.update_id as updateId,t.create_time as createTime,t.create_id as createId"
	return sqlColumns
}
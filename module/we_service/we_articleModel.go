package we_service

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/util/gconv"
	"gmanager/utils/base"
)

type Waluduo_article struct {
	// columns START
	Id            int    `json:"id" gconv:"id,omitempty"`                  		// 主键ID
	Title         string `json:"title" gconv:"title,omitempty"`       			// 标题
	Author        string `json:"author" gconv:"author,omitempty"` 				// 作者
	Publish_time  string `json:"publish_time" gconv:"publish_time,omitempty"`   // 发布时间
	Ctx     	  string `json:"ctx" gconv:"ctx,omitempty"`         			// 内容
	Createtime    string `json:"createtime" gconv:"createtime,omitempty"`       // 创建时间
	// columns END

	//base.BaseModel
}

func (model Waluduo_article) List(form *base.BaseForm) []Waluduo_article {
	where := " 1 = 1 "
	var params []interface{}
	if form.Params != nil && form.Params["name"] != "" {
		where += " and name like ? "
		params = append(params, "%"+form.Params["name"]+"%")
	}

	var resData []Waluduo_article
	err := model.dbModel("t").Fields(
		model.columns()).Where(where, params).OrderBy(form.OrderBy).Structs(&resData)
	if err != nil {
		glog.Error(model.TableName()+" list error", err)
		return []Waluduo_article{}
	}

	return resData
}

func (model *Waluduo_article) Insert() int64 {
	r, err := model.dbModel().Data(model).Insert()
	if err != nil {
		glog.Error(model.TableName()+" insert error", err)
		return 0
	}

	res, err2 := r.RowsAffected()
	if err2 != nil {
		glog.Error(model.TableName()+" insert res error", err2)
		return 0
	} else if res > 0 {
		lastId, err2 := r.LastInsertId()
		if err2 != nil {
			glog.Error(model.TableName()+" LastInsertId res error", err2)
			return 0
		} else {
			model.Id = gconv.Int(lastId)
		}
	}

	return res
}

func (model Waluduo_article) dbModel(alias ...string) *gdb.Model {
	var tmpAlias string
	if len(alias) > 0 {
		tmpAlias = " " + alias[0]
	}
	tableModel := g.DB().Table(model.TableName() + tmpAlias).Safe()
	return tableModel
}

func (model Waluduo_article) columns() string {
	sqlColumns := "t.id,t.title as title,t.author as author,t.publish_time as publish_time,t.ctx as ctx,t.createtime as createtime"
	return sqlColumns
}

func (model Waluduo_article) TableName() string {
	return "waluduo_article"
}
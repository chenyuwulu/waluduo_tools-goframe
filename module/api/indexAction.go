package api

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"gmanager/utils/base"
)

type IndexAction struct {
	base.BaseRouter
}

var (
	actionNameIndex = "IndexAction"
)

func (action *IndexAction) Index(r *ghttp.Request) {
	form := base.NewForm(r.GetPostMap())
	model := WaluduoUser{}
	page := model.Page(&form)
	glog.Info("访问到了这里",form)
	base.Succ(r, g.Map{
		"form": form,
		"page":page,
		"bbb": 2,
		"model":model,
	})
}
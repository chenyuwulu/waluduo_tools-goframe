package we_service

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"gmanager/utils/base"
)

type We_articleAction struct {
	base.BaseRouter
}

//var (
//	actionNameIndex = "IndexAction"
//)

func (action *We_articleAction) List(r *ghttp.Request) {
	form := base.NewForm(r.GetPostMap())
	base.Succ(r, g.Map{
		"这里是中文": "list",
		"这个是传过来的东西": form,
	})
}

func (action *We_articleAction) Create(r *ghttp.Request) {
	form := base.NewForm(r.GetPostMap())
	base.Succ(r, g.Map{
		"这里是中文": "create",
		"这个是传过来的东西": form,
	})
}
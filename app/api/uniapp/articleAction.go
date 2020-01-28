package uniapp

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"gmanager/library/base"
)

type ArticleAction struct {
	base.BaseRouter
}

//var (
//	actionNameIndex = "IndexAction"
//)

func (action *ArticleAction) Index(r *ghttp.Request) {
	form := base.NewForm(r.GetMap())
	base.Succ(r, g.Map{
		"form": form,
		"bbb": 2,
	})
}
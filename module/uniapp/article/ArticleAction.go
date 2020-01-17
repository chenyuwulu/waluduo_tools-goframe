package article

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"gmanager/utils/base"
)

type ArticleAction struct {
	base.BaseRouter
}

//var (
//	actionNameIndex = "IndexAction"
//)

func (action *ArticleAction) Index(r *ghttp.Request) {
	form := base.NewForm(r.GetPostMap())
	base.Succ(r, g.Map{
		"form": form,
		"bbb": 2,
	})
}
package we_service

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"gmanager/utils/base"
)

type CtxAction struct {
	base.BaseRouter
}

//var (
//	actionNameIndex = "IndexAction"
//)

func (action *CtxAction) Index(r *ghttp.Request) {
	//form := base.NewForm(r.GetPostMap())
	base.Succ(r, g.Map{
		"这里是中文": "看看",
	})
}
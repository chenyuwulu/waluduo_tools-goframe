package we_service

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"gmanager/utils"
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
	model := Waluduo_article{}

	list := model.List(&form)
	base.Succ(r, g.Map{
		"这里是中文": "list",
		"list": list,
	})
}

func (action *We_articleAction) Play_post(r *ghttp.Request) {
	form := base.NewForm(r.GetPostMap())
	model := Waluduo_article{}
	err := gconv.Struct(r.GetPostMap(), &model)
	model.Createtime = utils.GetNow()
	num := model.Insert()
	base.Succ(r, g.Map{
		"这里是中文": "create",
		"这个是传过来的东西": form,
		"err": err,
		"model": model,
		"userid": base.GetUser(r).Id,
		"num": num,
	})
}


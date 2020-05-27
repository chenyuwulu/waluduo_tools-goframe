package we_service

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/util/gconv"
	"gmanager/app/service/we_service"
	"gmanager/library/base"
)

type Action struct {
	base.BaseRouter
}

//var (
//	actionNameIndex = "IndexAction"
//)

func (action *Action) List(r *ghttp.Request) {
	//form := base.NewForm(r.GetMap())
	//
	//

	form := base.NewForm(r.GetQueryMap())

	list, err := we_service.List(&form)
	if err != nil {
		glog.Error("page error", err)
		base.Error(r, err.Error())
	}

	base.Succ(r, g.Map{
		"这里是中文啊": "list",
		"list": list,
	})
}

func (action *Action) Play_post(r *ghttp.Request) {
	//form := base.NewForm(r.GetMap())
	//model := Action{}
	//err := gconv.Struct(r.GetMap(), &model)
	//base.Succ(r, g.Map{
	//	"这里是中文": "create",
	//	"这个是传过来的东西": form,
	//	"err": err,
	//	"model": model,
	//	"userid": base.GetUser(r).Id,
	//})


	request := new(we_service.Request)
	err := gconv.Struct(r.GetQueryMap(), request)
	if err != nil {
		glog.Error("save struct error", err)
		base.Error(r, "save error")
	}

	request.UserId = base.GetUser(r).Id
	_, err = we_service.Save(request)
	if err != nil {
		base.Fail(r, "保存失败")
	}

	base.Succ(r, "")
}

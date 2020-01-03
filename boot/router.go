package boot

import (
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"gmanager/module/api"
	"gmanager/module/common"
	"gmanager/module/component/middle"
	"gmanager/module/constants"
	"gmanager/module/system"
	"gmanager/utils/base"
	"strings"
)

/*
绑定业务路由
*/
func bindRouter() {
	urlPath := g.Config().GetString("url-path")//获取到config中的“url-path”对应的路径是多少
	s := g.Server()
	// 首页
	s.BindHandler(urlPath+"/", common.Login)//函数注册，此路由绑定到Login函数
	s.BindHandler(urlPath+"/main.html", common.Index)//函数注册，此路由绑定到Index函数
	s.BindHandler(urlPath+"/login", common.Login)//函数注册，此路由绑定到Login函数

	s.BindHandler(urlPath+"/admin/welcome.html", common.Welcome)//函数注册，此路由绑定到Welcome函数
	// 中间件
	s.BindMiddleware(urlPath+"/*", middle.MiddlewareLog)//所有路由都绑定log日志的中间件
	s.BindMiddleware(urlPath+"/*", middle.MiddlewareCommon)//所有路由都绑定BASE_PATH中间件
	//绑定分组路由，这是system下的所有分组路由
	s.Group(urlPath+"/system", func(g *ghttp.RouterGroup) {
		// 系统路由
		userAction := new(system.UserAction)
		g.ALL("user", userAction)
		g.GET("/user/get/{id}", userAction.Get)
		g.ALL("user/delete/{id}", userAction.Delete)

		departAction := new(system.DepartmentAction)
		g.ALL("department", departAction)
		g.GET("/department/get/{id}", departAction.Get)
		g.ALL("/department/delete/{id}", departAction.Delete)

		logAction := new(system.LogAction)
		g.ALL("log", logAction)
		g.GET("/log/get/{id}", logAction.Get)
		g.ALL("/log/delete/{id}", logAction.Delete)

		menuAction := new(system.MenuAction)
		g.ALL("menu", menuAction)
		g.GET("/menu/get/{id}", menuAction.Get)
		g.ALL("/menu/delete/{id}", menuAction.Delete)

		roleAction := new(system.RoleAction)
		g.ALL("role", roleAction)
		g.GET("/role/get/{id}", roleAction.Get)
		g.ALL("/role/delete/{id}", roleAction.Delete)

		configAction := new(system.ConfigAction)
		g.ALL("config", configAction)
		g.GET("/config/get/{id}", configAction.Get)
		g.ALL("/config/delete/{id}", configAction.Delete)

	})
	//新增对应uniapp的api分组路由
	s.Group(urlPath+"/api", func(g *ghttp.RouterGroup) {
		indexAction := new(api.IndexAction)
		g.ALL("index", indexAction)
	})

	// 启动gtoken
	base.Token = &gtoken.GfToken{
		//Timeout:         10 * 1000,
		CacheMode:        g.Config().GetInt8("gtoken.cache-mode"),
		MultiLogin:       g.Config().GetBool("gtoken.multi-login"),
		LoginPath:        "/login/submit",
		LoginBeforeFunc:  common.LoginSubmit,
		LogoutPath:       "/user/logout",
		LogoutBeforeFunc: common.LogoutBefore,
		AuthPaths:        g.SliceStr{"/user", "/system"},
		AuthBeforeFunc: func(r *ghttp.Request) bool {
			// 静态页面不拦截
			if r.IsFileRequest() {
				return false
			}

			if strings.HasSuffix(r.URL.Path, "index") {
				return false
			}

			return true
		},
	}
	base.Token.Start()
}

/*
统一路由注册
*/
func initRouter() {

	s := g.Server()//获取到sever

	// 绑定路由
	bindRouter()

	if constants.DEBUG {
		g.DB().SetDebug(constants.DEBUG)
	}

	// 上线建议关闭
	s.BindHandler("/debug", common.Debug)

	// 301错误页面
	s.BindStatusHandler(301, common.Error301)
	// 404错误页面
	s.BindStatusHandler(404, common.Error404)
	// 500错误页面
	s.BindStatusHandler(500, common.Error500)

	// 某些浏览器直接请求favicon.ico文件，特别是产生404时
	s.SetRewrite("/favicon.ico", "/resources/images/favicon.ico")

	// 管理接口
	s.EnableAdmin("/admin")

	// 为平滑重启管理页面设置HTTP Basic账号密码
	//s.BindHookHandler("/admin/*", ghttp.HOOK_BEFORE_SERVE, func(r *ghttp.Request) {
	//	user := g.Config().GetString("admin.user")
	//	pass := g.Config().GetString("admin.pass")
	//	if !r.BasicAuth(user, pass) {
	//		r.ExitAll()
	//	}
	//})

	// 强制跳转到HTTPS访问
	//g.Server().BindHookHandler("/*", ghttp.HOOK_BEFORE_SERVE, func(r *ghttp.Request) {
	//    if !r.IsFileServe() && r.TLS == nil {
	//        r.Response.RedirectTo(fmt.Sprintf("https://%s%s", r.Host, r.URL.String()))
	//        r.ExitAll()
	//    }
	//})
}

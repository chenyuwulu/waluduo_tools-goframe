package router

import (
	v1 "server/app/api/v1"

	"github.com/gogf/gf/frame/g"
)

// InitBaseRouter 注册基础功能路由
func InitBaseRouter() {
	BaseRouter := g.Server().Group("base")
	{
		BaseRouter.POST("register", v1.AdminRegister)                 // 注册
		BaseRouter.POST("login", v1.GfJWTMiddleware.LoginHandler)     // 登录
		BaseRouter.POST("refresh", v1.GfJWTMiddleware.RefreshHandler) // 刷新Json Web Token
		BaseRouter.POST("captcha", v1.Captcha)                        // 生成验证码
	}
}

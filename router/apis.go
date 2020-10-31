package router

import (
	v1 "server/app/api/v1"
	"server/app/middleware"

	"github.com/gogf/gf/frame/g"
)

// InitApiRouter 注册功能api路由
func InitApiRouter() {
	ApiRouter := g.Server().Group("api").Middleware(
		middleware.JwtAuth,
		middleware.CasbinMiddleware,
	)
	{
		ApiRouter.POST("createApi", v1.CreateApi)   // 创建Api
		ApiRouter.POST("updateApi", v1.UpdateApi)   // 更新api
		ApiRouter.POST("deleteApi", v1.DeleteApi)   // 删除Api
		ApiRouter.POST("getApiById", v1.GetApiById) // 获取单条Api消息
		ApiRouter.POST("getAllApis", v1.GetAllApis) // 获取所有api
		ApiRouter.POST("getApiList", v1.GetApiList) // 获取Api列表
	}
}

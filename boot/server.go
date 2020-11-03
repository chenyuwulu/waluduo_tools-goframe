package boot

import (
	"server/app/middleware"
	"server/router"
	"time"

	"github.com/gogf/gf/frame/g"
)

func InitializeRunServer() {
	s := g.Server()//初始化服务
	s.Use(middleware.Error)//全局路由规则注册这个中间件
	s.SetReadTimeout(10 * time.Second)//读取延时
	s.SetWriteTimeout(10 * time.Second)//写入延时
	s.SetMaxHeaderBytes(1 << 20)//内存地址每位向左移一位，1*2的20次方，也就是1Mb
	s.SetIndexFolder(true)//当访问静态文件目录时，是否展示目录下的文件列表。默认关闭，那么请求将返回403
	//if g.Cfg("system").GetString("system.OssType") == "local" {
	//	s.AddStaticPath("/"+g.Cfg("oss").GetString("local.LocalPath"), g.Cfg("oss").GetString("local.LocalPath"))
	//}
	s.AddStaticPath("/form-generator", "public/page")//为添加URI与目录路径的映射关系，可以自定义静态文件目录的访问URI规则
	router.InitializeRouters()//初始化总路由
	//fmt.Printf(`
	//欢迎使用 Gf-Vue-Admin
	//当前版本:V1.1.2
	//默认前端文件运行地址:http://127.0.0.1:8080
	//`)
	s.Run()
}

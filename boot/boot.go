package boot

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"gmanager/module/component/started"
)

// 管理初始化顺序.
func init() {
	initConfig()
	initRouter()
	started.Start()
}

// 用于配置初始化.
func initConfig() {
	glog.Info("这里是config刚开始")

	v := g.View()
	c := g.Config()
	s := g.Server()

	// 配置对象及视图对象配置
	_ = c.AddPath("config")//配置信息指定

	v.SetDelimiters("${", "}")//为了避免和vue的模板语法冲突，使用{{}}以外的模板语法
	_ = v.AddPath("template")//模板目录指定

	glog.SetStdoutPrint(true)//glog是否继续在终端输出

	s.SetNameToUriType(ghttp.URI_TYPE_ALLLOWER)//路由控制器的名称，仅转为小写，单词间不使用连接符号

	glog.Info("这里是config结束")

}

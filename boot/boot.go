package boot

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
)

// 用于配置初始化.
func init() {
	glog.Info("########服务正在启动中...")

	v := g.View()   //模板引擎初始化
	c := g.Config() //配置信息初始化
	s := g.Server() //服务本体

	// 配置对象及视图对象配置
	_ = c.AddPath("config") //配置信息的路径

	_ = v.AddPath("template")                   //模板引擎的路径
	glog.SetStdoutPrint(true)                   //日志同步输出在当前的终端中
	s.SetNameToUriType(ghttp.URI_TYPE_ALLLOWER) //路由命名规则为：仅转为小写，单词间不使用连接符号

	glog.Info("########服务启动完成...")
}

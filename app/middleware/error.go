package middleware

import (
	"server/library/global"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)
//定义错误处理方法
func Error(r *ghttp.Request) {
	r.Middleware.Next()//后置中间件
	if err := r.GetError(); err != nil {//判断是否获取到错误
		g.Log("exception").Error(err)// 记录到自定义错误日志文件
		//返回固定的友好信息
		r.Response.ClearBuffer()//将原本缓冲区的输出内容清空
		global.FailWithMessage(r, "服务器居然开小差了，请稍后再试吧！")
	}
}

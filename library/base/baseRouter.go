package base

import (
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"gmanager/library/bean"
	"gmanager/library/resp"
)

var Token *gtoken.GfToken

// BaseRouter baseRouter 为所有其他路由器实现了全局设置.
type BaseRouter struct{}

//获取用户信息
func GetUser(r *ghttp.Request) bean.SessionUser {
	resp := Token.GetTokenData(r)
	if !resp.Success() {
		return bean.SessionUser{}
	}

	var sessionUser bean.SessionUser
	err := gjson.DecodeTo(resp.GetString("data"), &sessionUser)
	if err != nil {
		glog.Error("get session user error", err)
	}

	return sessionUser
}

//成功回调对象
func Succ(r *ghttp.Request, data interface{}) {
	_ = r.Response.WriteJson(resp.Succ(data))
	r.Exit()
}

//失败回调字符串
func Fail(r *ghttp.Request, msg string) {
	_ = r.Response.WriteJson(resp.Fail(msg))
	r.Exit()
}

//错误回调字符串
func Error(r *ghttp.Request, msg string) {
	_ = r.Response.WriteJson(resp.Error(msg))
	r.Exit()
}

//自定义code，msg，data回调
func Resp(r *ghttp.Request, code int, msg string, data interface{}) {
	_ = r.Response.WriteJson(resp.Resp{
		Code: code,
		Msg:  msg,
		Data: data,
	})
	r.Exit()
}

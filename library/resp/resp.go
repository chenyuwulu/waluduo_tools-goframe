package resp

import (
	"encoding/json"
	"github.com/gogf/gf/util/gconv"
)

//定义字符串常量
const (
	SUCCESS      = 0    //成功
	FAIL         = -1   //失败
	ERROR        = -99  //错误
	UNAUTHORIZED = -401 //未授权
)

//response的结构体
type Resp struct {
	Code int         `json:"code"`
	Msg  string      `json:"msg"`
	Data interface{} `json:"data"`
}

// 获取Data值转字符串（如果回调的code等于SUCCESS，返回true，否则false）
func (resp Resp) Success() bool {
	return resp.Code == SUCCESS
}

// 获取Data转字符串（将原本的对象转换成字符串）
func (resp Resp) DataString() string {
	return gconv.String(resp.Data)
}

// 获取Data转Int（将原本的对象转换成整形）
func (resp Resp) DataInt() int {
	return gconv.Int(resp.Data)
}

// 获取Data值转字符串
func (resp Resp) GetString(key string) string {
	return gconv.String(resp.Get(key))
}

// 获取Data值转Int
func (resp Resp) GetInt(key string) int {
	return gconv.Int(resp.Get(key))
}

// 获取Data值
func (resp Resp) Get(key string) interface{} {
	m := gconv.Map(resp.Data)
	if m == nil {
		return ""
	}
	return m[key]
}

func (resp Resp) Json() string {
	str, _ := json.Marshal(resp)
	return string(str)
}

// 成功
func Succ(data interface{}) Resp {
	return Resp{SUCCESS, "success", data}
}

// 失败
func Fail(msg string) Resp {
	return Resp{FAIL, msg, ""}
}

// 失败设置Data
func FailData(msg string, data interface{}) Resp {
	return Resp{FAIL, msg, data}
}

// 错误
func Error(msg string) Resp {
	return Resp{ERROR, msg, ""}
}

// 错误设置Data
func ErrorData(msg string, data interface{}) Resp {
	return Resp{ERROR, msg, data}
}

// 认证失败
func Unauthorized(msg string, data interface{}) Resp {
	return Resp{UNAUTHORIZED, msg, data}
}

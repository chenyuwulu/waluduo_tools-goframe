package library

import (
	"github.com/gogf/gf/os/gtime"
	"time"
)

//获取当前时间，格式为：2020-06-12 17:05:40
func GetNow() string {
	return gtime.Datetime()
}

//获取当前时间，格式为：1591952740
func GetNowStamp() int64 {
	return time.Now().Unix()
}

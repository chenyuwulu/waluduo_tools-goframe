package base

import "github.com/gogf/gf/util/gconv"

type BaseForm struct {
	Page          int    `form:"page",json:"page"`                   // 当前页码
	Rows          int    `form:"rows",json:"rows"`                   // 每页多少条
	TotalPage     int    `form:"totalPage",json:"totalPage"`         // 总页数
	TotalSize     int    `form:"totalSize",json:"totalSize"`         // 总共数据条数
	OrderBy       string `form:"orderBy",json:"orderBy"`             // 排序
	Appid         string `form:"appid",json:"appid"`                 // 排序
	Secret        string `form:"secret",json:"secret"`               // 排序
	Code          string `form:"code",json:"code"`                   // 排序
	EncryptedData string `form:"encryptedData",json:"encryptedData"` // 排序
	Iv            string `form:"iv",json:"iv"`                       // 排序
	Params        map[string]string
	Object        interface{}
}

func NewForm(params map[string]interface{}) BaseForm {
	form := BaseForm{}
	form.Params = make(map[string]string, 10)
	// 转换为map[string]string
	for key, value := range params {
		form.Params[key] = gconv.String(value)
	}
	//  第几页
	if value, ok := params["page"]; ok {
		form.Page = gconv.Int(value)
	}
	// 页数
	if value, ok := params["rows"]; ok {
		form.Rows = gconv.Int(value)
	}
	if value, ok := params["appid"]; ok {
		form.Appid = gconv.String(value)
	}
	if value, ok := params["secret"]; ok {
		form.Secret = gconv.String(value)
	}
	if value, ok := params["code"]; ok {
		form.Code = gconv.String(value)
	}
	if value, ok := params["iv"]; ok {
		form.Iv = gconv.String(value)
	}
	if value, ok := params["encryptedData"]; ok {
		form.EncryptedData = gconv.String(value)
	}
	// 排序
	if value, ok := params["orderBy"]; ok && value != "" {
		form.OrderBy = gconv.String(value)
	} else if value2, ok := params["sidx"]; ok && value2 != "" {
		form.OrderBy = gconv.String(value2)
		if value3, ok := params["sord"]; ok && value3 != "" {
			form.OrderBy += " " + gconv.String(value3)
		}
	}

	return form
}

func (form *BaseForm) SetParam(key string, value string) *BaseForm {
	form.Params[key] = value
	return form
}

func (form *BaseForm) SetParams(params map[string]string) *BaseForm {
	form.Page = gconv.Int(params["page"])
	form.Rows = gconv.Int(params["rows"])
	form.OrderBy = gconv.String(params["orderBy"])
	form.Params = params

	return form
}

func (form *BaseForm) SetObject(object interface{}) *BaseForm {
	form.Object = object

	return form
}

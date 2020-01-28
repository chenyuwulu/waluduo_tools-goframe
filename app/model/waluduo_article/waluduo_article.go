package waluduo_article

import "github.com/gogf/gf/util/gconv"

// Fill with you ideas below


func (r *Entity) PkVal() int {
	return gconv.Int(r.Id)
}

func (r *Entity) TableName() string {
	return Table
}

func (m *arModel) Columns() string {
	sqlColumns := "t.id,t.title as title,t.author as author,t.publish_time as publish_time,t.ctx as ctx,t.createtime as createtime"
	return sqlColumns
}
package response

import "server/app/model/authorities"

type AuthorityCopy struct {
	Authority      authorities.Authorities `json:"authority"`
	OldAuthorityId string                  `r:"oldAuthorityId" json:"oldAuthorityId"`
}

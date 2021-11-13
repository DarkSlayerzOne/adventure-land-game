package entities

import "time"

type BaseEntities struct {
	CreatedDate time.Time `json:"createdDate"`
	UpdatedDate time.Time `json:"updatedDate"`
}

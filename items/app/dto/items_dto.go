package dto

import (
	"time"
)

type ItemListDto struct {
	Total    int        `json:"total"`
	ItemType string     `json:"itemType"`
	Items    []ItemsDto `json:"items"`
}

type ItemsDto struct {
	ID                string    `json:"id"`
	Name              string    `json:"name"`
	Image             string    `json:"image"`
	ItemType          string    `json:"itemType"`
	SellingPrice      float32   `json:"sellingPrice"`
	Description       string    `json:"description"`
	QuantityDropRange int       `json:"quantityDropRange"`
	DropChance        float32   `json:"dropChance"`
	CreatedDate       time.Time `json:"createdDate"`
}

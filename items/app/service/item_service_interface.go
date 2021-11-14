package service

import (
	d "adventure-land-game/items/app/dto"
)

type ItemServiceInterface interface {
	GetItemList(searchTerm, itemType string, pageSize, pageIndex int) (*d.ItemListDto, error)
}

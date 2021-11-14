package service

import (
	r "adventure-land-game/items/app/data"
	d "adventure-land-game/items/app/dto"
	"log"
)

type itemServiceInterface struct{}

var _itemRepo r.ItemRepoInterface

func ItemServiceInterfaceImple(repo r.ItemRepoInterface) ItemServiceInterface {
	_itemRepo = repo
	return &itemServiceInterface{}
}

func (*itemServiceInterface) GetItemList(searchTerm, itemType string, pageSize, pageIndex int) (*d.ItemListDto, error) {

	result, total, err := _itemRepo.ItemList(searchTerm, itemType, pageSize, pageIndex)

	if err != nil {
		log.Fatal(err)
		return nil, err
	}

	items := d.ItemListDto{
		Total:    total,
		ItemType: itemType,
		Items:    *result,
	}

	return &items, nil
}

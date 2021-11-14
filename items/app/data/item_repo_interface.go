package data

import (
	d "adventure-land-game/items/app/dto"
)

type ItemRepoInterface interface {
	ItemList(searchTerm, itemType string, pageSize, pageIndex int) (*[]d.ItemsDto, int, error)

	GetGemDetail(gemID string) (*d.GemDto, error)

	GetWeaponDetail(weaponID string) (*d.WeaponsDto, error)

	GetArmorDetail(armorID string) (*d.ArmorDto, error)
}

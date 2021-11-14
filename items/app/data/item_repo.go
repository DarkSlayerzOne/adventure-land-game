package data

import (
	d "adventure-land-game/items/app/dto"
	"context"
	"database/sql"
	"time"
)

type itemRepo struct{}

const (
	readItems       string = "sp_read_items"
	getWeaponDetail string = "sp_weapon_detail"
	getArmorDetail  string = "sp_armor_details"
	getemDetail     string = "sp_gem_details"
)

func ItemRepoInterfaceImpl() ItemRepoInterface {
	return &itemRepo{}
}

func (*itemRepo) ItemList(searchTerm, itemType string, pageSize, pageIndex int) (*[]d.ItemsDto, int, error) {

	db, sqlError := DbConnection()

	if sqlError != nil {
		return nil, 0, sqlError
	}

	var items []d.ItemsDto

	ctx := context.Background()

	err := db.PingContext(ctx)
	if err != nil {
		return nil, 0, err
	}

	var totalRecords int

	result, err := db.QueryContext(ctx, readItems,
		sql.Named("SearchTerm", searchTerm),
		sql.Named("ItemType", itemType),
		sql.Named("PageSize", pageSize),
		sql.Named("PageIndex", pageIndex),
		sql.Named("Total", sql.Out{Dest: &totalRecords}))

	if err != nil {
		return nil, 0, err
	}

	defer result.Close()

	for result.Next() {

		var id, name, image, itemType, description string
		var quantityDropRange int
		var sellingPrice, dropChance float32
		var createdDate time.Time

		err := result.Scan(&id, &name, &image, &itemType, &sellingPrice, &description, &quantityDropRange, &dropChance, &createdDate)

		if err != nil {
			return nil, 0, err
		}

		items = append(items, d.ItemsDto{
			ID:                id,
			Name:              name,
			Image:             image,
			ItemType:          itemType,
			SellingPrice:      sellingPrice,
			Description:       description,
			QuantityDropRange: quantityDropRange,
			DropChance:        dropChance,
			CreatedDate:       createdDate,
		})
	}

	return &items, totalRecords, nil
}

func (*itemRepo) GetGemDetail(gemID string) (*d.GemDto, error) {
	return nil, nil
}

func (*itemRepo) GetWeaponDetail(weaponID string) (*d.WeaponsDto, error) {
	return nil, nil
}

func (*itemRepo) GetArmorDetail(armorID string) (*d.ArmorDto, error) {
	return nil, nil
}

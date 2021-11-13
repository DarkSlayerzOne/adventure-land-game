package entities

type EnemyItemDrops struct {
	ID              string  `json:"id"`
	EnemyDropRateID string  `json:"EnemyDropRateID"`
	ItemID          string  `json:"ItemId"`
	DropRate        float32 `json:"dropRate"`
	BaseEntities
}

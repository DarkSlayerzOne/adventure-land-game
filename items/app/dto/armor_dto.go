package dto

type ArmorDto struct {
	ID                 string `json:"id"`
	Name               string `json:"name"`
	Image              string `json:"image"`
	Category           string `json:"category"`
	ItemType           string `json:"itemType"`
	LevelRequirement   int64  `json:"levelRequirement"`
	MeleeDefensePoints int64  `json:"meleeDefensePoints"`
	MagicDefensePoints int64  `json:"magicDefensePoints"`
	DodgePoints        int64  `json:"dodgePoints"`
	HPPoints           int64  `json:"hpPoints"`
	SpeedPoints        int64  `json:"speedPoints"`
	SlotNumber         int64  `json:"slotNumber"`
	SellingPrice       int64  `json:"sellingPrice"`
	Description        string `json:"description"`
	QuantityDropRange  int64  `json:"quantityDropRange"`
	DropChance         int64  `json:"dropChance"`
	CreatedDate        string `json:"createdDate"`
}

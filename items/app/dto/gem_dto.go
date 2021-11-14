package dto

type GemDto struct {
	ID                 string `json:"id"`
	Name               string `json:"name"`
	Image              string `json:"image"`
	Category           string `json:"category"`
	ItemType           string `json:"itemType"`
	Equipment          string `json:"equipment"`
	Description        string `json:"description"`
	QuantityDropRange  int64  `json:"quantityDropRange"`
	DropChance         int64  `json:"dropChance"`
	Level              int64  `json:"level"`
	AtkPoints          int64  `json:"atkPoints"`
	AtkSpeedPoints     int64  `json:"atkSpeedPoints"`
	MagicPoints        int64  `json:"magicPoints"`
	CriticalChance     int64  `json:"criticalChance"`
	LevelRequirement   int64  `json:"levelRequirement"`
	MeleeDefensePoints int64  `json:"meleeDefensePoints"`
	MagicDefensePoints int64  `json:"magicDefensePoints"`
	DodgePoints        int64  `json:"dodgePoints"`
	HPPoints           int64  `json:"hpPoints"`
	SpeedPoints        int64  `json:"speedPoints"`
	SellingPrice       int64  `json:"sellingPrice"`
	CreatedDate        string `json:"createdDate"`
}

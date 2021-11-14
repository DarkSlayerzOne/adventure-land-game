package dto

type WeaponsDto struct {
	ID                string `json:"id"`
	Name              string `json:"name"`
	Image             string `json:"image"`
	Category          string `json:"category"`
	Weapon            string `json:"weapon"`
	LevelRequirement  int64  `json:"levelRequirement"`
	AtkPoints         int64  `json:"atkPoints"`
	AtkSpeedPoints    int64  `json:"atkSpeedPoints"`
	MagicPoints       int64  `json:"magicPoints"`
	CriticalChance    int64  `json:"criticalChance"`
	SlotNumber        int64  `json:"slotNumber"`
	ItemType          string `json:"itemType"`
	SellingPrice      int64  `json:"sellingPrice"`
	Description       string `json:"description"`
	QuantityDropRange int64  `json:"quantityDropRange"`
	DropChance        int64  `json:"dropChance"`
	CreatedDate       string `json:"createdDate"`
}

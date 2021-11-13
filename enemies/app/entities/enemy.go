package entities

type Enemy struct {
	ID            string `json:"id"`
	Name          string `json:"name"`
	Image         string `json:"image"`
	IsActive      bool   `json:"isActive"`
	Description   string `json:"description"`
	MonsterTypeID string `json:"monsterTypeID"`
	IsBoss        bool   `json:"isBoss"`
	AreaID        string `json:"areaID"`
	CreatedDate   string `json:"createdDate"`
	UpdatedDate   string `json:"updatedDate"`
}

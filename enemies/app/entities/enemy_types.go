package entities

type EnemyTypes struct {
	ID          string `json:"id"`
	Type        string `json:"type"`
	Description string `json:"description"`
	BaseEntities
}

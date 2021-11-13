package entities

type EnemyDrops struct {
	ID          string  `json:"id"`
	EnemyID     float32 `json:"enemyID"`
	KelaMin     float32 `json:"kelaMin"`
	KelaMax     float32 `json:"kelaMax"`
	CreatedDate string  `json:"createdDate"`
	BaseEntities
}

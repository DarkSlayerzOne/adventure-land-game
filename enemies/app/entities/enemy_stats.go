package entities

type EnemyStats struct {
	ID             string  `json:"id"`
	EnemyID        string  `json:"enemyID"`
	Level          int64   `json:"level"`
	Health         float32 `json:"health"`
	Damage         float32 `json:"damage"`
	Defense        float32 `json:"defense"`
	Critical       float32 `json:"critical"`
	CriticalChance float32 `json:"criticalChance"`
	SightRadius    float32 `json:"sightRadius"`
	Speed          float32 `json:"speed"`
	PursuitWait    float32 `json:"pursuitWait"`
	PursuitStop    float32 `json:"pursuitStop"`
	SpawnTimeRate  float32 `json:"spawnTimeRate"`
	BaseEntities
}

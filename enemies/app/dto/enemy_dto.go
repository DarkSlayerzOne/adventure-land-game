package dto

type EnemyDto struct {
	Name           string  `json:"name" validate:"required"`
	Image          string  `json:"image" validate:"required"`
	Description    string  `json:"description" validate:"required"`
	MonsterTypeID  string  `json:"monsterTypeID" validate:"required"`
	IsBoss         bool    `json:"isBoss" validate:"required"`
	AreaID         string  `json:"areaID" validate:"required"`
	Level          int64   `json:"level" validate:"required"`
	Health         float32 `json:"health" validate:"required"`
	Damage         float32 `json:"damage" validate:"required"`
	Defense        float32 `json:"defense" validate:"required"`
	Critical       float32 `json:"critical" validate:"required"`
	CriticalChance float32 `json:"criticalChance" validate:"required"`
	SightRadius    float32 `json:"sightRadius" validate:"required"`
	Speed          float32 `json:"speed" validate:"required"`
	PursuitWait    float32 `json:"pursuitWait" validate:"required"`
	PursuitStop    float32 `json:"pursuitStop" validate:"required"`
	SpawnTimeRate  float32 `json:"spawnTimeRate" validate:"required"`
}

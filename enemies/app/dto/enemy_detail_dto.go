package dto

import (
	h "adventure-land-game/enemies/app/helper"
	"time"

	_ "github.com/denisenkom/go-mssqldb"
)

type EnemyDetailDto struct {
	ID          string       `json:"id"`
	Name        string       `json:"name"`
	Image       string       `json:"image"`
	Description string       `json:"description"`
	Type        string       `json:"type"`
	IsActive    bool         `json:"isActive"`
	IsBoss      bool         `json:"isBoss"`
	Area        EnemyAreaDto `json:"area"`
	Stats       EnemyStatDto `json:"stats"`
	CreatedDate time.Time    `json:"createdDate"`
}

type EnemyStatDto struct {
	Level          h.NullInt32   `json:"level"`
	Health         h.NullFloat64 `json:"health"`
	Damage         h.NullFloat64 `json:"damage"`
	Critical       h.NullFloat64 `json:"critical"`
	CriticalChance h.NullFloat64 `json:"criticalChance"`
	SightRadius    h.NullFloat64 `json:"sightRadius"`
	Speed          h.NullFloat64 `json:"speed"`
	PursuitWait    h.NullFloat64 `json:"pursuitWait"`
	PursuitStop    h.NullFloat64 `json:"pursuitStop"`
	SpawnTimeRate  h.NullFloat64 `json:"spawnTimeRate"`
}

type EnemyAreaDto struct {
	Area     string `json:"area"`
	Image    string `json:"image"`
	AreaType string `json:"areaType"`
}

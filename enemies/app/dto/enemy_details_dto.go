package dto

import (
	"time"
)

type EnemyDetailsDto struct {
	Total   int          `json:"total"`
	Enemies []EnemiesDto `json:"enemies"`
}

type EnemiesDto struct {
	ID          string    `json:"id"`
	Name        string    `json:"name"`
	Image       string    `json:"image"`
	Description string    `json:"description"`
	Type        string    `json:"type"`
	IsActive    bool      `json:"isActive"`
	IsBoss      bool      `json:"isBoss"`
	CreatedDate time.Time `json:"createdDate"`
}

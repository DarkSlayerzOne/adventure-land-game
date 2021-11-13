package data

import (
	"adventure-land-game/enemies/app/dto"
	"adventure-land-game/enemies/app/entities"
)

type EnemyRepoInterface interface {
	CreateEnemy(enemy *entities.Enemy, enemyStats *entities.EnemyStats) (string, error)

	DeleteEnemy(enemyID string) (*entities.Enemy, error)

	UpdateEnemy(enemy *entities.Enemy) (bool, error)

	EnemyDetalList(pageSize, pageIndex int, searchIndex string) ([]dto.EnemiesDto, int, error)

	EnemyDetail(enemyID string) (*dto.EnemyDetailDto, error)
}

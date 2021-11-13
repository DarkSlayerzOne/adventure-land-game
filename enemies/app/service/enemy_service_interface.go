package service

import (
	d "adventure-land-game/enemies/app/dto"
)

type EnemyServiceInterface interface {
	CreateEnemy(enemy d.EnemyDto) (string, error)
	ReadEnemyDetails(pageSize, pageIndex int, searchIndex string) (*d.EnemyDetailsDto, error)
	ReadEnemyDetail(enemyID string) (*d.EnemyDetailDto, error)
}

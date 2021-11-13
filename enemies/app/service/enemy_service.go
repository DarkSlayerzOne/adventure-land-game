package service

import (
	r "adventure-land-game/enemies/app/data"
	d "adventure-land-game/enemies/app/dto"
	e "adventure-land-game/enemies/app/entities"
	"log"
)

type enemyService struct{}

var _enemyRepo r.EnemyRepoInterface

func EnemyServiceImpl(enemyRepo r.EnemyRepoInterface) EnemyServiceInterface {
	_enemyRepo = enemyRepo
	return &enemyService{}
}

func (*enemyService) CreateEnemy(enemy d.EnemyDto) (string, error) {

	enemyModel := e.Enemy{
		Name:          enemy.Name,
		Image:         enemy.Image,
		Description:   enemy.Description,
		MonsterTypeID: enemy.MonsterTypeID,
		IsBoss:        enemy.IsBoss,
		AreaID:        enemy.AreaID,
	}

	enemyStatsModel := e.EnemyStats{
		Level:          enemy.Level,
		Health:         enemy.Health,
		Damage:         enemy.Damage,
		Defense:        enemy.Defense,
		Critical:       enemy.Critical,
		CriticalChance: enemy.CriticalChance,
		SightRadius:    enemy.SightRadius,
		Speed:          enemy.Speed,
		PursuitWait:    enemy.PursuitWait,
		PursuitStop:    enemy.PursuitStop,
		SpawnTimeRate:  enemy.SpawnTimeRate,
	}

	id, err := _enemyRepo.CreateEnemy(&enemyModel, &enemyStatsModel)

	if err != nil {
		log.Fatal(err)
		return "", nil
	}

	return id, nil
}

func (*enemyService) ReadEnemyDetails(pageSize, pageIndex int, searchIndex string) (*d.EnemyDetailsDto, error) {

	enemies, total, err := _enemyRepo.EnemyDetalList(pageSize, pageIndex, searchIndex)

	if err != nil {
		log.Fatal(err)
		return nil, err
	}

	enemyDetails := d.EnemyDetailsDto{
		Total:   total,
		Enemies: enemies,
	}

	return &enemyDetails, nil
}

func (*enemyService) ReadEnemyDetail(enemyID string) (*d.EnemyDetailDto, error) {
	enemy, err := _enemyRepo.EnemyDetail(enemyID)

	if err != nil {
		log.Fatal(err)
		return nil, err
	}

	return enemy, nil
}

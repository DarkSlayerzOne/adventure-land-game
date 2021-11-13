package data

import (
	"adventure-land-game/enemies/app/dto"
	e "adventure-land-game/enemies/app/entities"
	h "adventure-land-game/enemies/app/helper"
	"context"
	"database/sql"
	"time"
)

const (
	createEnemy string = "sp_create_enemy"
	readEnemies string = "sp_read_enemy_details"
	readEnemy   string = "sp_read_enemy_detail"
)

type enemyRepo struct{}

func EnemyRepoImpl() EnemyRepoInterface {
	return &enemyRepo{}
}

func (*enemyRepo) CreateEnemy(enemy *e.Enemy, enemyStats *e.EnemyStats) (string, error) {

	db, sqlError := DbConnection()
	var err error

	if sqlError != nil {
		return "", sqlError
	}

	ctx := context.Background()
	err = db.PingContext(ctx)
	if err != nil {
		return "", err
	}

	stmt, err := db.Prepare(createEnemy)
	if err != nil {
		return "", err
	}
	defer stmt.Close()

	row := stmt.QueryRowContext(
		ctx,
		sql.Named("Name", enemy.Name),
		sql.Named("Image", enemy.Image),
		sql.Named("Description", enemy.Description),
		sql.Named("MonsterTypeID", enemy.MonsterTypeID),
		sql.Named("Description", enemy.Description),
		sql.Named("IsBoss", enemy.IsBoss),
		sql.Named("AreaID", enemy.AreaID),
		sql.Named("Level", enemyStats.Level),
		sql.Named("Health", enemyStats.Health),
		sql.Named("Damage", enemyStats.Damage),
		sql.Named("Critical", enemyStats.Critical),
		sql.Named("CriticalChance", enemyStats.CriticalChance),
		sql.Named("SightRadius", enemyStats.SightRadius),
		sql.Named("Speed", enemyStats.Speed),
		sql.Named("PursuitWait", enemyStats.PursuitWait),
		sql.Named("PursuitStop", enemyStats.PursuitStop),
		sql.Named("SpawnTimeRate", enemyStats.SpawnTimeRate),
		sql.Named("CreatedDate", time.Now()))

	var enemyID string
	err = row.Scan(&enemyID)

	if err != nil {
		return "", err
	}

	return enemyID, nil
}

func (*enemyRepo) DeleteEnemy(enemyID string) (*e.Enemy, error) {
	return nil, nil
}

func (*enemyRepo) UpdateEnemy(enemy *e.Enemy) (bool, error) {
	return false, nil
}

func (*enemyRepo) EnemyDetalList(pageSize, pageIndex int, searchIndex string) ([]dto.EnemiesDto, int, error) {

	db, sqlError := DbConnection()

	if sqlError != nil {
		return nil, 0, sqlError
	}

	var enemies []dto.EnemiesDto

	ctx := context.Background()

	err := db.PingContext(ctx)
	if err != nil {
		return nil, 0, err
	}

	var totalRecords int

	result, err := db.QueryContext(ctx, readEnemies,
		sql.Named("SearchTerm", searchIndex),
		sql.Named("PageSize", pageSize),
		sql.Named("PageIndex", pageIndex),
		sql.Named("Total", sql.Out{Dest: &totalRecords}))

	if err != nil {
		return nil, 0, err
	}

	defer result.Close()

	for result.Next() {

		var id, name, image, description, monsterType string
		var isActive, isBoss bool
		var createdDate time.Time

		err := result.Scan(&id, &name, &image, &description, &monsterType, &isActive, &isBoss, &createdDate)

		if err != nil {
			return nil, 0, err
		}

		enemies = append(enemies, dto.EnemiesDto{
			ID:          id,
			Name:        name,
			Image:       image,
			Description: description,
			Type:        monsterType,
			IsActive:    isActive,
			IsBoss:      isBoss,
			CreatedDate: createdDate,
		})
	}

	return enemies, totalRecords, nil
}

func (*enemyRepo) EnemyDetail(enemyID string) (*dto.EnemyDetailDto, error) {

	db, sqlError := DbConnection()

	if sqlError != nil {
		return nil, sqlError
	}

	ctx := context.Background()

	err := db.PingContext(ctx)

	if err != nil {
		return nil, err
	}

	result, err := db.QueryContext(ctx, readEnemy,
		sql.Named("ID", enemyID))

	if err != nil {
		return nil, err
	}

	defer result.Close()

	var enemyDetail dto.EnemyDetailDto

	for result.Next() {

		var id, name, image, description, monsterType, area, areaImage, areaType string
		var isActive, isBoss bool
		var createdDate time.Time
		var level h.NullInt32
		var health, damage, critical, criticalChance, sightRadius, speed, pursuitWait, pursuitStop, spawnTimeRate h.NullFloat64

		err := result.Scan(&id, &name,
			&image,
			&description,
			&monsterType,
			&isActive,
			&isBoss,
			&area,
			&areaImage,
			&areaType,
			&level,
			&health,
			&damage,
			&critical,
			&criticalChance,
			&sightRadius,
			&speed,
			&pursuitWait,
			&pursuitStop,
			&spawnTimeRate,
			&createdDate)

		if err != nil {
			return nil, err
		}

		enemyDetail.ID = id
		enemyDetail.Name = name
		enemyDetail.Image = image
		enemyDetail.Description = description
		enemyDetail.Type = monsterType
		enemyDetail.IsActive = isActive
		enemyDetail.IsBoss = isBoss
		enemyDetail.Area.Area = area
		enemyDetail.Area.AreaType = areaType
		enemyDetail.Area.Image = areaImage
		enemyDetail.Stats.Level = level
		enemyDetail.Stats.Health = health
		enemyDetail.Stats.Damage = damage
		enemyDetail.Stats.Critical = critical
		enemyDetail.Stats.CriticalChance = criticalChance
		enemyDetail.Stats.SightRadius = sightRadius
		enemyDetail.Stats.Speed = speed
		enemyDetail.Stats.PursuitWait = pursuitWait
		enemyDetail.Stats.PursuitStop = pursuitStop
		enemyDetail.Stats.SpawnTimeRate = spawnTimeRate
		enemyDetail.CreatedDate = createdDate
	}

	return &enemyDetail, nil
}

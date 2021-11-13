Use Enemies;
GO

CREATE PROC sp_create_enemy
    @Name nvarchar(150),
    @Image nvarchar(700),
    @Description nvarchar(500),
    @MonsterTypeID nvarchar(250),
    @IsBoss bit,
    @AreaID nvarchar(250),
    @Level int,
    @Health decimal,
    @Damage decimal,
    @Critical decimal,
    @CriticalChance decimal,
    @SightRadius decimal,
    @Speed decimal,
    @PursuitWait decimal,
    @PursuitStop decimal,
    @SpawnTimeRate decimal,
    @CreatedDate datetime
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ID nvarchar(250)
    SET @ID = UPPER(NEWID())

    INSERT INTO Enemy(ID, Name, Image, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) 
    VALUES (@ID, @Name, @Image, @Description, @MonsterTypeID, @IsBoss, @AreaID, @CreatedDate)

    INSERT INTO EnemyStats(ID, EnemyID, Level, Health, Damage, Critical, CriticalChance, SightRadius, Speed, PursuitWait, PursuitStop, SpawnTimeRate, CreatedDate)
    VALUES (UPPER(NEWID()),  @ID, @Level, @Health, @Damage, @Critical, @CriticalChance, @SightRadius, @Speed, @PursuitWait, @PursuitStop, @SpawnTimeRate, @CreatedDate)

    SELECT @ID as EnemyID

END
GO


CREATE PROC sp_read_enemy_details
    @SearchTerm nvarchar(150),
	@PageSize int,
	@PageIndex int,
	@Total int output
AS
BEGIN
    SET NOCOUNT ON;
	
    SELECT e.ID, e.Name, e.Image, e.Description,  et.Type, e.IsActive, e.IsBoss, e.CreatedDate FROM Enemy e 
    INNER JOIN EnemyTypes et ON e.MonsterTypeID=et.ID
    INNER JOIN _READONLY_Areas a ON e.AreaID=a.ID
    WHERE e.Name LIKE IIF(ISNULL(@SearchTerm, '') = '', e.Name, '%' + @SearchTerm + '%')
    ORDER BY e.CreatedDate DESC
    OFFSET @PageSize * (@PageIndex -1) ROWS
    FETCH NEXT @PageSize ROWS ONLY OPTION (RECOMPILE)
	SELECT @Total=COUNT(*) FROM Enemy
END
GO

CREATE PROC sp_read_enemy_detail
@ID nvarchar(150)
AS
BEGIN
	 SET NOCOUNT ON;

	 SELECT e.ID, e.Name, e.Image, e.Description, et.Type, e.IsActive, e.IsBoss, a.Name as Area, a.Image as AreaImage, a.AreaType, es.Level, es.Health, es.Damage, es.Critical, es.CriticalChance, es.SightRadius, es.Speed, es.PursuitWait, es.PursuitStop, es.SpawnTimeRate, e.CreatedDate 
	    FROM Enemy e 
		INNER JOIN EnemyTypes et ON e.MonsterTypeID=et.ID
 		LEFT JOIN EnemyStats es ON es.EnemyID=e.ID
		INNER JOIN _READONLY_Areas a ON e.AreaID=a.ID
		WHERE e.ID=@ID 
END 

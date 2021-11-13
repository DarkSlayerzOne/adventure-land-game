CREATE DATABASE Enemies;
GO
Use Enemies;
GO

CREATE TABLE Enemy (
    ID nvarchar(250) not null primary key,  
    Name nvarchar(150) not null ,
    Image nvarchar(700) null ,
    IsActive bit not null,
    Description nvarchar(500) not null,
    MonsterTypeID nvarchar(250) not null,
    IsBoss bit not null default 1,
    AreaID nvarchar(250) not null,
    CreatedDate datetime not null,
    UpdatedDate datetime null  
);
GO

CREATE TABLE EnemyStats (
    ID nvarchar(250) not null primary key,
    EnemyID nvarchar(250) not null,
    Level int not null,
    Health decimal not null,
    Damage decimal not null,
    Critical decimal not null,
    CriticalChance decimal not null,
    SightRadius decimal not null,
    Speed decimal not null,
    PursuitWait decimal not null,
    PursuitStop decimal not null,
    SpawnTimeRate decimal not null,
    CreatedDate datetime not null,
    UpdatedDate datetime null,
    Constraint fk_EnemyStatsEnemyID Foreign key (EnemyID) References dbo.Enemy(ID)
);
GO

CREATE TABLE EnemyDropRates (
    ID nvarchar(250) not null primary key,
    EnemyID nvarchar(250) not null,
    KelaMin decimal not null,
    KelaMax decimal not null,
    CreatedDate datetime not null,
    UpdatedDate datetime null,
    Constraint fk_EnemyDropRatesEnemyID Foreign key (EnemyID) References dbo.Enemy(ID)
);
GO

CREATE TABLE EnemyItemDrops (
    ID nvarchar(250) not null primary key,
    EnemyDropRateID nvarchar(250) not null,
    ItemId nvarchar(250) not null,
    DropRate decimal not null, 
    CreatedDate datetime not null,
    UpdatedDate datetime null,
    Constraint fk_EnemyItemDropsEnemyID Foreign key (EnemyID) References dbo.EnemyDropRates(ID)
);
GO

CREATE TABLE EnemyTypes (
    ID nvarchar(250) not null primary key,
    Type nvarchar(20) not null,
    Description nvarchar(150) not null,
    CreatedDate datetime not null,
    UpdatedDate datetime null
);
GO


-- READ ONLY TABLES

CREATE TABLE _READONLY_Areas(
	ID nvarchar(250) not null primary key,  
    Name nvarchar(150) not null ,
    Image nvarchar(700) null ,
    IsActive bit not null,
    Description nvarchar(500) not null,
	AreaType nvarchar(100) not null,
    CreatedDate datetime not null,
    UpdatedDate datetime null   
);
GO
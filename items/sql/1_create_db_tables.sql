CREATE DATABASE Item;
GO
Use Item;
GO

CREATE TABLE Items(
    ID nvarchar(250) not null primary key,  
    ItemTypeID nvarchar(250) not null,
    Name nvarchar(150) not null,
    Image nvarchar(700) null,
    IsActive bit not null default 1,
    Description nvarchar(500) not null,
    SellingPrice decimal not null,
    QuantityDropRange int not null,
    DropChance int not null,
    IsNPCSellingIt bit not null default 1,
    CreatedDate datetime not null,
    UpdatedDate datetime null  
);
GO

CREATE TABLE Weapon(
    ID nvarchar(250) not null primary key,  
    ItemsID nvarchar(250) not null,
    CategoryID nvarchar(250) not null,
    WeaponTypeID nvarchar(250) not null,
    LevelRequirement int not null,
    AtkPoints decimal not null,
    AtkSpeedPoints decimal not null,
    MagicPoints decimal not null,
    CriticalChance int not null,
    SlotNumber  int not null default 0,
    CreatedDate datetime not null,
    UpdatedDate datetime null,
    Constraint fk_ItemWeaponID Foreign key (ItemsID) References dbo.Items(ID)
);
GO

CREATE TABLE Armor(
    ID nvarchar(250) not null primary key,  
    ItemsID nvarchar(250) not null,
    CategoryID nvarchar(250) not null,
    ArmorTypeID  nvarchar(250) not null,
    LevelRequirement int not null,
    MeleeDefensePoints decimal not null,
    MagicDefensePoints decimal not null,
    DodgePoints decimal not null,
    HPPoints decimal not null,
    SpeedPoints decimal not null,
    SlotNumber  int not null default 0,
    CreatedDate datetime not null,
    UpdatedDate datetime null,
    Constraint fk_ItemArmorID Foreign key (ItemsID) References dbo.Items(ID)
);
GO

CREATE TABLE Prestige(
    ID nvarchar(250) not null primary key,  
    ItemsID nvarchar(250) not null,
    CategoryID nvarchar(250) not null,
    ClassRequirementID nvarchar(250) not null,
    LevelRequirement int not null,
    CreatedDate datetime not null,
    UpdatedDate datetime null,
    Constraint fk_ItemPrestigeID Foreign key (ItemsID) References dbo.Items(ID)
);
GO

CREATE TABLE Gem(
    ID nvarchar(250) not null primary key,  
    ItemsID nvarchar(250) not null,
    CategoryID nvarchar(250) not null,
    EquipmentTypeID nvarchar(250) not null,
    Level int not null,
    AtkPoints decimal not null default 0,
    AtkSpeedPoints decimal not null default 0,
    MagicPoints decimal not null default 0,
    CriticalChance int not null default 0,
    LevelRequirement int not null default 0,
    MeleeDefensePoints decimal not null default 0,
    MagicDefensePoints decimal not null default 0,
    DodgePoints decimal not null default 0,
    HPPoints decimal not null default 0,
    SpeedPoints decimal not null default 0,
    CreatedDate datetime not null,
    UpdatedDate datetime null,
    Constraint fk_ItemGemID Foreign key (ItemsID) References dbo.Items(ID)
);
GO

CREATE TABLE Category(
    ID nvarchar(250) not null primary key,  
    Category nvarchar(50) not null,
    LevelMin int,
    LevelMax int,
    Description nvarchar(150) not null,
);
GO

CREATE TABLE EquipmentType(
    ID nvarchar(250) not null primary key,  
    Equipment nvarchar(50) not null,
);
GO

CREATE TABLE WeaponType(
    ID nvarchar(250) not null primary key,  
    Weapon nvarchar(50) not null,
);
GO

CREATE TABLE ArmorType(
    ID nvarchar(250) not null primary key,  
    Armor nvarchar(50) not null,
);
GO

CREATE TABLE ItemType( 
    ID nvarchar(250) not null primary key,  
    Item nvarchar(50) not null,
);
GO


-- READ ONLY TABLES

CREATE TABLE _READONLY_ClassTypes(
    ClassRequirementID nvarchar(250) not null primary key,  
    Name nvarchar(250) not null,
    CreatedDate datetime not null,
    UpdatedDate datetime null,
)
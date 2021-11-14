Use Item;
GO

CREATE PROC sp_read_items
    @SearchTerm nvarchar(150),
	@ItemType nvarchar(50),
	@PageSize int,
	@PageIndex int,
	@Total int output
AS
BEGIN
	 SET NOCOUNT ON;

	 SELECT i.ID, i.Name, i.Image, it.Item as ItemType,  i.SellingPrice, i.Description, i.QuantityDropRange, i.DropChance, i.CreatedDate
	 FROM Items i INNER JOIN ItemType it ON i.ItemTypeID=it.ID
	 WHERE i.Name LIKE IIF(ISNULL(@SearchTerm, '') = '', i.Name, '%' + @SearchTerm + '%')
	 AND it.Item=@ItemType
	 ORDER BY i.CreatedDate DESC
	 OFFSET @PageSize * (@PageIndex -1) ROWS
	 FETCH NEXT @PageSize ROWS ONLY OPTION (RECOMPILE)

	 SELECT @Total=COUNT(*) FROM Items i INNER JOIN ItemType it ON i.ItemTypeID=it.ID WHERE it.Item=@ItemType 
END
GO


 CREATE PROC sp_weapon_detail
 @ID nvarchar(250)
 AS
 BEGIN
	
	 SET NOCOUNT ON;

	 SELECT  i.ID, i.Name, i.Image, c.Category, wt.Weapon, w.LevelRequirement, w.AtkPoints, w.AtkSpeedPoints, w.MagicPoints,
		 	 w.CriticalChance, w.SlotNumber, it.Item as ItemType, i.SellingPrice, i.Description, i.QuantityDropRange, i.DropChance, i.CreatedDate
	 FROM Items i 
			INNER JOIN ItemType it ON i.ItemTypeID=it.ID
			INNER JOIN Weapon w ON i.ID=w.ItemsID
			INNER JOIN Category c ON w.CategoryID=c.ID
			INNER JOIN WeaponType  wt ON w.WeaponTypeID=wt.ID
		WHERE i.ID=@ID
 END
 GO

CREATE PROC sp_armor_details
 @ID nvarchar(250)
 AS
 BEGIN

   SET NOCOUNT ON;
   SELECT	i.ID, i.Name, i.Image, c.Category, it.Item as ItemType, a.LevelRequirement, a.MeleeDefensePoints,
			a.MagicDefensePoints, a.DodgePoints, a.HPPoints, a.SpeedPoints, a.SlotNumber,
			i.SellingPrice, i.Description, i.QuantityDropRange, i.DropChance, i.CreatedDate
	 FROM Items i 
			INNER JOIN ItemType it ON i.ItemTypeID=it.ID
			INNER JOIN Armor a ON i.ID=a.ItemsID
			INNER JOIN Category c ON a.CategoryID=c.ID
			INNER JOIN ArmorType at ON a.ArmorTypeID=at.ID
		WHERE i.ID=@ID
 END
 GO

 ALTER PROC [dbo].[sp_gem_details]
 @ID nvarchar(250)
 AS
 BEGIN

   SET NOCOUNT ON;
   SELECT	i.ID, i.Name, i.Image, c.Category, it.Item as ItemType, et.Equipment, i.Description, i.QuantityDropRange, i.DropChance,
			g.Level, g.AtkPoints, g.AtkSpeedPoints, g.MagicPoints, g.CriticalChance, g.LevelRequirement, g.MeleeDefensePoints, g.MagicDefensePoints,
			g.DodgePoints, g.HPPoints, g.SpeedPoints,
			i.SellingPrice, i.CreatedDate
	 FROM Items i 
			INNER JOIN ItemType it ON i.ItemTypeID=it.ID
			INNER JOIN Gem g ON i.ID=g.ItemsID
			INNER JOIN Category c ON g.CategoryID=c.ID
			INNER JOIN EquipmentType et ON g.EquipmentTypeID=et.ID
		WHERE i.ID=@ID
END
GO




































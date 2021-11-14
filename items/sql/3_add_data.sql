Use Item;
GO

INSERT INTO ItemType(ID, Item) VALUES ('4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Scrap')
INSERT INTO ItemType(ID, Item) VALUES ('43A47A79-B6D6-4ED4-BBB9-33377F471A35', 'Weapon')
INSERT INTO ItemType(ID, Item) VALUES ('67978C54-5742-4F54-AA33-766F49570946', 'Armor')
INSERT INTO ItemType(ID, Item) VALUES ('F06D0E38-5BB9-4D3B-B5CD-8E7756277030', 'Prestige')
INSERT INTO ItemType(ID, Item) VALUES ('B3804C49-9923-4D3E-AF10-8C5ABAB12236', 'Gem')

INSERT INTO Category(ID, Category, LevelMin, LevelMax, Description) VALUES ('B4F40543-EAC2-4BB7-9A8F-C129E8A24A5D', 'Novice', 1, 20, 'Starters of the game.' )
INSERT INTO Category(ID, Category, LevelMin, LevelMax, Description) VALUES ('B2CEE3A1-E60D-4F87-A506-9F3211972EFB', 'Adventurer', 21, 30, 'Players who reached level 21.' )
INSERT INTO Category(ID, Category, LevelMin, LevelMax, Description) VALUES ('0E23C4A5-5C3A-4CEC-8662-5CE62584BE34', 'Master', 31, 40, 'Players who reached level 31.' )
INSERT INTO Category(ID, Category, LevelMin, LevelMax, Description) VALUES ('49242194-3F17-4032-807B-B0613163276B', 'Legend', 41, 50, 'Players who reached level 41.' )
INSERT INTO Category(ID, Category, LevelMin, LevelMax, Description) VALUES ('DB274F4B-D567-4196-974B-3C59223080E9', 'Myth', 51, 55, 'Players who reached level 51.' ) 

INSERT INTO EquipmentType(ID, Equipment) VALUES ('410A3DD6-BC3B-4FF3-80FF-D099848E95BB', 'Weapon')
INSERT INTO EquipmentType(ID, Equipment) VALUES ('BCC0A302-A28B-4D5B-B8F6-7A6214647D6B', 'Shield')
INSERT INTO EquipmentType(ID, Equipment) VALUES ('A4B13AFB-D41E-4CCD-900A-ED80226E44F7', 'Armor')

INSERT INTO WeaponType(ID, Weapon) VALUES ('CD0392E7-4033-49FF-B121-4C10DC65020E', 'Sword')
INSERT INTO WeaponType(ID, Weapon) VALUES ('A2328A66-B75A-429E-BBC4-D69862C883AA', 'Two-Handed Sword')
INSERT INTO WeaponType(ID, Weapon) VALUES ('DAD727AD-5A70-4BC8-A59F-D12017755CFB', 'Two-Handed Axe')
INSERT INTO WeaponType(ID, Weapon) VALUES ('674BFB4C-2D22-4D6F-B64B-759C0F7DAFD3', 'Two-Handed Mace')
INSERT INTO WeaponType(ID, Weapon) VALUES ('DE6391A2-8003-4AF4-A6F8-5DC6B612B4CD', 'Mace')
INSERT INTO WeaponType(ID, Weapon) VALUES ('E96C895A-27DD-4B0A-A9AB-4D75E2C3DB2F', 'Bow')
INSERT INTO WeaponType(ID, Weapon) VALUES ('3E2D26F5-2862-44D3-813D-15EE1CEC23E6', 'Crossbow')
INSERT INTO WeaponType(ID, Weapon) VALUES ('5ABE726C-5AB7-4057-B062-3B523119938F', 'Staff')
INSERT INTO WeaponType(ID, Weapon) VALUES ('F36035F3-C14B-4AA5-AF6A-3B1DD371089B', 'Shield')
INSERT INTO WeaponType(ID, Weapon) VALUES ('0C499838-3C20-49FC-9B77-3C0A80C95E59', 'Wand')

INSERT INTO ArmorType(ID, Armor) VALUES ('F640273C-3807-434D-A28D-DD0FC39DA96A', 'Heavy-Armor')
INSERT INTO ArmorType(ID, Armor) VALUES ('5C881396-D0A9-4345-97F8-171387EF3FB4', 'Light-Armor')
INSERT INTO ArmorType(ID, Armor) VALUES ('0BB47F46-1400-4A91-847E-C23731E8EC91', 'Ranger-Suit')
INSERT INTO ArmorType(ID, Armor) VALUES ('18E66C11-CC75-45E0-B95A-18D692A107DD', 'Robe')
INSERT INTO ArmorType(ID, Armor) VALUES ('EB0C81E6-120C-485A-A423-E0FDB0B92A77', 'Mantle')
INSERT INTO ArmorType(ID, Armor) VALUES ('C825675D-BF75-4985-91DB-C86537A342B8', 'Cloak')
 
-- Insert Scraps 
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('A5401977-5B09-4AD7-A0DC-09BCC9BB77C6', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Paper', '', 'A piece of paper', 3, 10, 100, GETDATE())
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('C89031B3-17D7-4497-B5B5-E777FC26FF17', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Mushroom spore', '', 'A mushroom spore that is worth for selling for villagers to make potion', 30, 5, 100, GETDATE())
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('12751305-44AC-4C04-9035-A4CC2F70F8D5', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Clean Mushroom', '', 'Use to make ornaments and to be sold throughout the land.', 35, 4, 70, GETDATE())
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('F605F8C5-0915-481D-8BEE-41B553AD21C5', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Flower Gleam', '', 'A rare flower that shines like a rainbow when a fullmoon rises. It can be traded to shamans.', 200, 1, 10, GETDATE())
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('B09041CD-3648-4A9C-B595-7905464D75B8', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Broken Necklace', '', 'Items that where stolen by Bandits in some ruins', 20, 2, 100, GETDATE())
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('5BCBD191-F12C-4054-9046-F79D88A8972F', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Broken Pouch', '', 'A pouch from a fallen bandit.', 10, 1, 100, GETDATE())
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('478B6A21-F14F-43DB-BF54-832F22115156', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Weapon scrap', '', 'A weapon part from a fallen bandit', 50, 1, 40, GETDATE())
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('E7D6904B-353D-4B3D-BC6D-EA0186AC8A5E', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Crystal Skull', '', 'A crystal skull can be found underground that it is said that anyone has acquired it shall have eternal life. It can be traded to shamans.', 500, 10, 5, GETDATE())
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('5892D836-EDF2-4769-986F-57D18E9D4A4E', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Rock Sand', '', 'An element that can be used to create cement it is being used to make homes and castles', 80, 2, 60, GETDATE())
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('C071C7C8-5C75-47EA-BDDA-D486FCBC360E', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Bear Hide', '', 'A hide from a bear. It used by blacksmiths to create armors', 50, 3, 70, GETDATE())
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('7140DC69-466C-4BD5-9DAE-C62DB38EDA99', '4A1BBE3E-34F5-4A5B-9AB9-BA626DC1B567', 'Forest Dragon Scale', '', 'Elder Shamans of the enchanted forest use this scales to create magic potions. Trade this item to the Elder Shamans to have great rewards', 0, 1, 100, GETDATE())

--Insert Swords -- Novice types
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('5C5CE2CC-BE41-41F4-BB17-63071EA0D5AA', '43A47A79-B6D6-4ED4-BBB9-33377F471A35', 'Villager Short Sword', '', 'Short sword for new adventurers', 60, 1, 20, GETDATE())
INSERT INTO Weapon(ID, ItemsID, CategoryID, WeaponTypeID, LevelRequirement, AtkPoints ,AtkSpeedPoints, MagicPoints, CriticalChance, SlotNumber, CreatedDate)VALUES('3D7D119F-844C-4D4B-84EE-ACACC35A5D76', '5C5CE2CC-BE41-41F4-BB17-63071EA0D5AA', 'B4F40543-EAC2-4BB7-9A8F-C129E8A24A5D', 'CD0392E7-4033-49FF-B121-4C10DC65020E', 1, 10, 7, 0, 10, 0, GETDATE())

--Insert Swords -- Adventurer types
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('F903C03D-C09B-480A-97E9-588C9F651A76', '43A47A79-B6D6-4ED4-BBB9-33377F471A35', 'Wilderness Sword', '', 'A sword crafted from the enchanted forest', 75, 1, 15, GETDATE())
INSERT INTO Weapon(ID, ItemsID, CategoryID, WeaponTypeID, LevelRequirement, AtkPoints ,AtkSpeedPoints, MagicPoints, CriticalChance, SlotNumber, CreatedDate)VALUES('E6067FC1-2E0E-4F28-98FD-0F296581E200', 'F903C03D-C09B-480A-97E9-588C9F651A76', 'B4F40543-EAC2-4BB7-9A8F-C129E8A24A5D', 'CD0392E7-4033-49FF-B121-4C10DC65020E', 10, 30, 16, 0, 20, 1, GETDATE())

--Insert Twohanded Swords
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('4422E172-3F82-4E01-864F-A54F07943265', '43A47A79-B6D6-4ED4-BBB9-33377F471A35', 'Villager Great Sword', '', 'A great sword used by village guards', 70, 1, 15, GETDATE())
INSERT INTO Weapon(ID, ItemsID, CategoryID, WeaponTypeID, LevelRequirement, AtkPoints ,AtkSpeedPoints, MagicPoints, CriticalChance, SlotNumber, CreatedDate)VALUES('1D65CD6A-C4B2-4346-B422-559FF3F13BF3', '4422E172-3F82-4E01-864F-A54F07943265', 'B4F40543-EAC2-4BB7-9A8F-C129E8A24A5D', 'A2328A66-B75A-429E-BBC4-D69862C883AA', 7, 40, 2, 0, 10, 0, GETDATE())

--Insert Armor
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('8EABFBFB-B95F-413A-8678-7AAF785D0088', '67978C54-5742-4F54-AA33-766F49570946', 'Villager Armor', '', 'Armor used by novice swordsman', 40, 1, 15, GETDATE())
INSERT INTO Armor(ID, ItemsID, CategoryID, ArmorTypeID, LevelRequirement, MeleeDefensePoints, MagicDefensePoints, DodgePoints, HPPoints, SpeedPoints, SlotNumber, CreatedDate) VALUES ('73302A27-892A-4737-81FE-6BD95B75B6E4', '8EABFBFB-B95F-413A-8678-7AAF785D0088', 'B4F40543-EAC2-4BB7-9A8F-C129E8A24A5D', '5C881396-D0A9-4345-97F8-171387EF3FB4', 1, 10, 0, 0, 30, 0, 0, GETDATE())

--Insert Gem
INSERT INTO Items(ID, ItemTypeID, Name, Image, Description, SellingPrice, QuantityDropRange, DropChance, CreatedDate) VALUES('5B6448C1-A4E6-4CA6-80DC-5CE2F756BA8D', 'B3804C49-9923-4D3E-AF10-8C5ABAB12236', '5th Grade Ruby', '', 'A small ruby', 20, 3, 30, GETDATE())
INSERT INTO Gem(ID, ItemsID, CategoryID, EquipmentTypeID, Level, AtkPoints, AtkSpeedPoints, MagicPoints, CriticalChance, LevelRequirement,  MeleeDefensePoints, MagicDefensePoints, DodgePoints, HPPoints, SpeedPoints, CreatedDate) VALUES('FFA71EEF-BA56-41E6-9D49-47AFDC064DC2', '5B6448C1-A4E6-4CA6-80DC-5CE2F756BA8D', 'B4F40543-EAC2-4BB7-9A8F-C129E8A24A5D', '410A3DD6-BC3B-4FF3-80FF-D099848E95BB', 5, 5, 2, 0, 0, 10,0,0,0,0,0,GETDATE() )
 
































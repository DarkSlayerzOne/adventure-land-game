Use Enemies;
GO

 

INSERT INTO EnemyTypes (ID, Type, Description, CreatedDate) VALUES ('ECF71E14-1299-4E33-95C9-B0FE27F3EC38', 'Human', 'A human enemy.', GETDATE())
INSERT INTO EnemyTypes (ID, Type, Description, CreatedDate) VALUES ('B895FD15-46CA-4893-9A67-9FEF9D8E178C', 'Plant', 'A living plant enemy.', GETDATE())
INSERT INTO EnemyTypes (ID, Type, Description, CreatedDate) VALUES ('FF29761D-F92F-40D8-B908-216A8E261007', 'Beast', 'A beast or mammal enemy.', GETDATE())
INSERT INTO EnemyTypes (ID, Type, Description, CreatedDate) VALUES ('23F85799-F9B6-4647-B21E-E61B8647C69E', 'Reptile', 'A reptile enemy.', GETDATE())
INSERT INTO EnemyTypes (ID, Type, Description, CreatedDate) VALUES ('6463FB80-77A1-45F1-AF80-496959218816', 'Aquatic', 'An aquatic enemy.', GETDATE())
INSERT INTO EnemyTypes (ID, Type, Description, CreatedDate) VALUES ('1366B1F5-4F15-4A3E-9B06-474051157024', 'Undead', 'An undead enemy.', GETDATE())
INSERT INTO EnemyTypes (ID, Type, Description, CreatedDate) VALUES ('A3058F1D-0EF6-47AA-ADDF-7BB160B003D5', 'Aerial', 'A flying enemy.', GETDATE())
INSERT INTO EnemyTypes (ID, Type, Description, CreatedDate) VALUES ('E5DE0BA0-7489-4D9C-9945-A43FD1921583', 'Orcs', 'An orc enemy.', GETDATE())
INSERT INTO EnemyTypes (ID, Type, Description, CreatedDate) VALUES ('98DCB7B0-611C-4E5F-8E4F-255F6CA706B7', 'Dragons', 'A dragon enemy.', GETDATE())

INSERT INTO _READONLY_Areas(ID, Name, Image, IsActive, Description, AreaType, CreatedDate) VALUES('FD7C5350-9CBD-4EDC-9372-10FBE7773819', 'Enchanted Forest', 'https://img.redbull.com/images/c_fill,g_auto,w_820,h_563/q_auto,f_auto/redbullcom/2014/12/01/1331692810422_2/the-enchanted-forest', 1, 'Lorem ipsum', 'Forest', GETDATE())
INSERT INTO _READONLY_Areas(ID, Name, Image, IsActive, Description, AreaType, CreatedDate) VALUES('E66BCC2C-C0C4-409C-B10A-4C7ACB7ED783', 'Deep Ocean', 'https://www.newstatesman.com/wp-content/uploads/sites/2/2021/06/2021_25_deep_sea-scaled.jpg', 1, 'Lorem ipsum', 'Water', GETDATE())

INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('E8A617AE-3C91-4080-94E1-98D5C3AA9C76', 'Spore', 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/large_mushroom_people_enemy_dark_soul.jpg', 1, 'Lorem ipsum', 'B895FD15-46CA-4893-9A67-9FEF9D8E178C', 0, 'FD7C5350-9CBD-4EDC-9372-10FBE7773819', GETDATE())
INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('0071E679-AB0D-40E2-9817-58F067433EFA', 'Elder Spore', 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/large_mushroom_people_enemy_dark_soul.jpg', 1, 'Lorem ipsum', 'B895FD15-46CA-4893-9A67-9FEF9D8E178C', 0, 'FD7C5350-9CBD-4EDC-9372-10FBE7773819', GETDATE())
INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('01373758-AADB-4DDD-BB03-F721065462F5', 'King Spore', 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/large_mushroom_people_enemy_dark_soul.jpg', 1, 'Lorem ipsum', 'B895FD15-46CA-4893-9A67-9FEF9D8E178C', 0, 'FD7C5350-9CBD-4EDC-9372-10FBE7773819', GETDATE())
INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('DED04509-8A9B-4EDF-8DB7-1BFF40E2A013', 'Stoner', 'https://i.pinimg.com/originals/f4/43/38/f44338b2dcabc70061e443b3de27be9a.jpg', 1, 'Lorem ipsum', 'B895FD15-46CA-4893-9A67-9FEF9D8E178C', 0, 'FD7C5350-9CBD-4EDC-9372-10FBE7773819', GETDATE())
INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('B20903C4-028A-45D7-AC56-1DBDC3A1C093', 'Elder Stoner', 'https://i.pinimg.com/originals/f4/43/38/f44338b2dcabc70061e443b3de27be9a.jpg', 1, 'Lorem ipsum', 'B895FD15-46CA-4893-9A67-9FEF9D8E178C', 0, 'FD7C5350-9CBD-4EDC-9372-10FBE7773819', GETDATE())
INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('84DF4AE1-736D-40DC-BE46-BAB3099A96F4', 'Poison Spore', 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/large_mushroom_people_enemy_dark_soul.jpg', 1, 'Lorem ipsum', 'B895FD15-46CA-4893-9A67-9FEF9D8E178C', 0, 'FD7C5350-9CBD-4EDC-9372-10FBE7773819', GETDATE())
INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('4A73D3DB-6E10-4563-8849-4471E3BA829B', 'Elder Poison Spore', 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/large_mushroom_people_enemy_dark_soul.jpg', 1, 'Lorem ipsum', 'B895FD15-46CA-4893-9A67-9FEF9D8E178C', 0, 'FD7C5350-9CBD-4EDC-9372-10FBE7773819', GETDATE())
INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('A4DF4E78-C607-40D4-87D9-2141DA05DB35', 'Rock Shark', 'https://static.wikia.nocookie.net/aliceinwonderland/images/4/4a/The_shark-monster.jpg/revision/latest?cb=20160812095931', 1, 'Lorem ipsum', '6463FB80-77A1-45F1-AF80-496959218816', 0, 'E66BCC2C-C0C4-409C-B10A-4C7ACB7ED783', GETDATE())
INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('89EDA3AB-26B2-4B30-95A2-5FD95D686966', 'Elder Rock Shark', 'https://static.wikia.nocookie.net/aliceinwonderland/images/4/4a/The_shark-monster.jpg/revision/latest?cb=20160812095931', 1, 'Lorem ipsum', '6463FB80-77A1-45F1-AF80-496959218816',  0, 'E66BCC2C-C0C4-409C-B10A-4C7ACB7ED783', GETDATE())
INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('F801E3D8-87E8-4859-95B3-5B8BAD0DE710', 'Octo', 'https://cdna.artstation.com/p/assets/images/images/006/420/468/large/suneth-deeptha-02.jpg?1498475896', 1, 'Lorem ipsum', '6463FB80-77A1-45F1-AF80-496959218816',  0, 'E66BCC2C-C0C4-409C-B10A-4C7ACB7ED783', GETDATE())
INSERT INTO Enemy(ID, Name, Image, IsActive, Description, MonsterTypeID, IsBoss, AreaID, CreatedDate) VALUES ('E01D70A5-2393-4A63-9C64-9AB5FCE12331', 'Octo Krakken', 'https://cdna.artstation.com/p/assets/images/images/006/420/468/large/suneth-deeptha-02.jpg?1498475896', 1, 'Lorem ipsum', '6463FB80-77A1-45F1-AF80-496959218816', 1,  'E66BCC2C-C0C4-409C-B10A-4C7ACB7ED783', GETDATE())














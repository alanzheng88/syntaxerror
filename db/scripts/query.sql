INSERT INTO products(
             name, price, brand, category, created_at, updated_at)
    VALUES ('QuickWatch',299,'Xiaowei Inc.','Wearable Tech',current_timestamp,current_timestamp),
('Precision-Book X Series',899,'Xiaowei Inc.','Computers & laptops',current_timestamp,current_timestamp),
('PrecisionCell P series',499,'Xiaowei Inc.','Mobile Devices',current_timestamp,current_timestamp),
('PrecisionCell adaptor',26.99,'Xiaowei Inc.','MISC',current_timestamp,current_timestamp),
('Smartgear',349,'Smartcell Tech','Wearable Tech',current_timestamp,current_timestamp),
('Smartbook',879.99,'Smartcell Tech','Computers & laptops',current_timestamp,current_timestamp),
('Smartcell',699,'Smartcell Tech','Mobile Devices',current_timestamp,current_timestamp),
('Smartbook laptop protector',69.99,'Smartcell Tech','MISC',current_timestamp,current_timestamp),
('Krusche Time (T-series)',399,'Krusche Corp','Wearable Tech',current_timestamp,current_timestamp),
('Krusche Mint II',799,'Krusche Corp','Computers & laptops',current_timestamp,current_timestamp),
('Krusche Quick S3',699,'Krusche Corp','Mobile Devices',current_timestamp,current_timestamp),
('Krusche USB Charger',14.49,'Krusche Corp','MISC',current_timestamp,current_timestamp);

INSERT INTO roles (role, created_at, updated_at)
VALUES
('Site Administrator',current_timestamp,current_timestamp),
('Vendor Adminstrator',current_timestamp,current_timestamp),
('Vendor Manager',current_timestamp,current_timestamp),
('User',current_timestamp,current_timestamp);

INSERT INTO vendors (vendor, locationkey, created_at, updated_at)
VALUES
('SmartBuy',1,current_timestamp,current_timestamp),
('KCIX',2,current_timestamp,current_timestamp),
('Present Shop',3,current_timestamp,current_timestamp),
('The Post',4,current_timestamp,current_timestamp),
('ShopComm',5,current_timestamp,current_timestamp);

INSERT INTO users (username, firstname, lastname, password, email, rolekey, userlistkey, created_at, updated_at)
VALUES
('username1','Wendy','','Password1','asdf1@email.com',1,1,current_timestamp,current_timestamp),
('username2','Lin','Wei','Password2','asdf2@email.com',2,2,current_timestamp,current_timestamp),
('username3','David ','McDonald','Password3','asdf3@email.com',3,3,current_timestamp,current_timestamp),
('username4','Victor','Schmatter','Password4','asdf4@email.com',4,4,current_timestamp,current_timestamp),
('username5','Janice','Wong','Password5','asdf5@email.com',5,5,current_timestamp,current_timestamp),
('username6','Andy ','Lee','Password6','asdf6@email.com',6,6,current_timestamp,current_timestamp),
('username7','Wilson','Chan','Password7','asdf7@email.com',7,7,current_timestamp,current_timestamp),
('username8','Devin ','Sim','Password8','asdf8@email.com',8,8,current_timestamp,current_timestamp)
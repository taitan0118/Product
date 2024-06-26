CREATE DATABASE ASM_JAVA5;
USE ASM_JAVA5;

-- Tạo bảng Categories
CREATE TABLE Categories (
    Id char(4) PRIMARY KEY,
    Name NVARCHAR(50)
);

-- Tạo bảng Products
CREATE TABLE Products (
    Id INT PRIMARY KEY not null,
    Name NVARCHAR(50),
	Image nvarchar(50),
	Sale FLOAT,
    Price FLOAT,
	Inventory int,
	Sex bit,
	describe nvarchar(200),
	CategoryId char(4),
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);
-- Tạo bảng Accounts
CREATE TABLE Accounts (
    Username nvarchar(50) PRIMARY KEY not null,
    Password VARCHAR(50),
    Fullname nvarchar(50),
	Email nvarchar(50),
	Photo nvarchar(50),
	Admin bit
);
-- Tạo bảng Orders
CREATE TABLE Orders (
    Id bigint PRIMARY KEY not null,
	Username nvarchar(50),
    CreateDate DATETIME,
    Address nvarchar(100),
    FOREIGN KEY (Username) REFERENCES Accounts(Username)
);

-- Tạo bảng Order Details
CREATE TABLE OrderDetails (
	Id bigint primary key,
    OrderId bigint,
    ProductId INT,
	Price FLOAT,
    Quantity INT,
    FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);
-- Insert dữ liệu vào bảng Categories
INSERT INTO Categories (Id, Name) VALUES
('A001', N'Áo'),
('Q001', N'Quần'),
('M001', N'Mũ'),
('G001', N'Giày');

-- Áo
INSERT INTO Products (Id, Name, Image, Sale, Price, Inventory, Sex, describe, CategoryId) VALUES
(1, N'Áo T-shirt cổ tròn', 'ao1.jpg', 150000, 200000, 50, 1, N'Áo T-shirt cổ tròn màu trắng', 'A001'),
(2, N'Áo thun đồng phục', 'ao2.jpg', 100000, 150000, 30, 1, N'Áo thun đồng phục màu xanh lá', 'A001'),
(3, N'Áo khoác gió', 'ao3.jpg', 250000, 300000, 20, 1, N'Áo khoác gió chống nước', 'A001'),
(4, N'Áo sơ mi tay dài', 'ao4.jpg', 200000, 250000, 40, 1, N'Áo sơ mi tay dài', 'A001'),
(5, N'Áo len cổ lọ', 'ao5.jpg', 230000, 280000, 25, 0, N'Áo len cổ lọ cho nữ', 'A001'),
(6, N'Áo vest basic', 'ao6.jpg', 370000, 400000, 15, 1, N'Áo vest basic cho nam', 'A001'),
(7, N'Áo dầu', 'ao7.jpg', 130000, 180000, 35, 1, N'Áo dầu chống nước', 'A001'),
(8, N'Áo blazer', 'ao8.jpg', 390000, 450000, 10, 0, N'Áo blazer dáng dài cho nữ', 'A001');

-- Quần
INSERT INTO Products (Id, Name, Image, Sale, Price, Inventory, Sex, describe, CategoryId) VALUES
(9, N'Quần jean skinny', 'quan1.jpg', 250000, 300000, 45, 1, N'Quần jean skinny cho nam', 'Q001'),
(10, N'Quần short kaki', 'quan2.jpg', 150000, 180000, 35, 1, N'Quần short kaki', 'Q001'), 
(11, N'Quần tây ống rộng', 'quan3.jpg', 370000, 400000, 25, 0, N'Quần tây ống rộng cho nữ', 'Q001'),
(12, N'Quần jogger', 'quan4.jpg', 200000, 220000, 30, 1, N'Quần jogger thể thao', 'Q001'),
(13, N'Quần chinos', 'quan5.jpg', 230000, 250000, 40, 1, N'Quần chinos cho nam', 'Q001'),
(14, N'Quần baggy', 'quan6.jpg', 230000, 280000, 20, 0, N'Quần baggy cho nữ', 'Q001'),
(15, N'Quần legging', 'quan7.jpg', 130000, 150000, 50, 0, N'Quần legging cho nữ', 'Q001'),
(16, N'Quần jeans ống rộng', 'quan8.jpg', 300000, 350000, 15, 0, N'Quần jeans ống rộng cho nữ', 'Q001');

-- Mũ
INSERT INTO Products (Id, Name, Image, Sale, Price, Inventory, Sex, describe, CategoryId) VALUES
(17, N'Mũ lưỡi trai', 'mu1.jpg', 50000, 80000, 60, 1, N'Mũ lưỡi trai', 'M001'),
(18, N'Mũ bucket', 'mu2.jpg', 80000, 100000, 45, 0, N'Mũ bucket', 'M001'),
(19, N'Mũ snapback', 'mu3.jpg', 100000, 120000, 35, 1, N'Mũ snapback', 'M001'),
(20, N'Mũ nồi', 'mu4.jpg', 110000, 150000, 25, 1, N'Mũ nồi', 'M001'),
(21, N'Mũ len', 'mu5.jpg', 65000, 90000, 40, 0, N'Mũ len', 'M001'),
(22, N'Mũ tai thỏ', 'mu6.jpg', 50000, 80000, 30, 0, N'Mũ tai thỏ', 'M001'),
(23, N'Mũ baker boy', 'mu7.jpg', 100000, 110000, 20, 0, N'Mũ baker boy', 'M001'),
(24, N'Mũ fedora', 'mu8.jpg', 160000, 180000, 15, 1, N'Mũ fedora', 'M001');

-- Giày
INSERT INTO Products (Id, Name, Image, Sale, Price, Inventory, Sex, describe, CategoryId) VALUES
(25, N'Giày sneaker', 'giay1.jpg', 400000, 500000, 55, 1, N'Giày sneaker', 'G001'),
(26, N'Giày thể thao', 'giay2.jpg', 350000, 400000, 40, 0, N'Giày thể thao', 'G001'),
(27, N'Giày sandal', 'giay3.jpg', 280000, 300000, 30, 0, N'Giày sandal', 'G001'),
(28, N'Giày boot', 'giay4.jpg', 720000, 800000, 20, 1, N'Giày boot', 'G001'),
(29, N'Giày lười', 'giay5.jpg', 380000, 400000, 35, 1, N'Giày lười', 'G001'),
(30, N'Giày cao gót', 'giay6.jpg', 560000, 600000, 25, 0, N'Giày cao gót', 'G001'),
(31, N'Giày da', 'giay7.jpg', 870000, 900000, 15, 1, N'Giày da', 'G001'),
(32, N'Giày dép', 'giay8.jpg', 150000, 200000, 45, 0, N'Giày dép', 'G001');


-- Thêm 8 áo
INSERT INTO Products (Id, Name, Image, Sale, Price, Inventory, Sex, describe, CategoryId) VALUES
(33, N'Áo polo', 'ao9.jpg', 220000, 270000, 45, 1, N'Áo polo cổ đức', 'A001'),
(34, N'Áo thun in họa tiết', 'ao10.jpg', 180000, 220000, 35, 0, N'Áo thun in họa tiết cho nữ', 'A001'),
(35, N'Áo sơ mi kẻ sọc', 'ao11.jpg', 270000, 320000, 25, 1, N'Áo sơ mi kẻ sọc tay ngắn', 'A001'),
(36, N'Áo khoác denim', 'ao12.jpg', 350000, 400000, 20, 1, N'Áo khoác denim có thể tháo tay', 'A001'),
(37, N'Áo sweater cổ tim', 'ao13.jpg', 290000, 340000, 30, 0, N'Áo sweater cổ tim cho nữ', 'A001'),
(38, N'Áo kimono', 'ao14.jpg', 260000, 300000, 25, 0, N'Áo kimono họa tiết', 'A001'),
(39, N'Áo croptop', 'ao15.jpg', 150000, 180000, 40, 0, N'Áo croptop trẻ trung', 'A001'),
(40, N'Áo khoác hoodie', 'ao16.jpg', 320000, 370000, 15, 1, N'Áo khoác hoodie có in logo', 'A001');

-- Thêm 8 quần
INSERT INTO Products (Id, Name, Image, Sale, Price, Inventory, Sex, describe, CategoryId) VALUES
(41, N'Quần ống loe', 'quan9.jpg', 350000, 400000, 25, 0, N'Quần ống loe dáng dài', 'Q001'),
(42, N'Quần culottes', 'quan10.jpg', 280000, 320000, 30, 0, N'Quần culottes xếp li', 'Q001'),
(43, N'Quần palazz', 'quan11.jpg', 320000, 370000, 20, 0, N'Quần palazz ống rộng', 'Q001'),
(44, N'Quần short jeans', 'quan12.jpg', 180000, 220000, 40, 1, N'Quần short jeans rách gối', 'Q001'),
(45, N'Quần linen', 'quan13.jpg', 250000, 300000, 25, 1, N'Quần linen thoáng mát', 'Q001'),
(46, N'Quần cargo', 'quan14.jpg', 280000, 320000, 30, 1, N'Quần cargo nhiều túi', 'Q001'),
(47, N'Quần cạp cao', 'quan15.jpg', 320000, 370000, 20, 0, N'Quần cạp cao ôm dáng', 'Q001'),
(48, N'Quần wide leg', 'quan16.jpg', 350000, 400000, 25, 0, N'Quần wide leg suông', 'Q001');

-- Thêm 8 mũ
INSERT INTO Products (Id, Name, Image, Sale, Price, Inventory, Sex, describe, CategoryId) VALUES
(49, N'Mũ fisherman', 'mu9.jpg', 120000, 150000, 35, 1, N'Mũ fisherman dệt từ len', 'M001'),
(50, N'Mũ beanie', 'mu10.jpg', 90000, 110000, 40, 1, N'Mũ beanie dệt kim', 'M001'),
(51, N'Mũ cói', 'mu11.jpg', 140000, 160000, 25, 0, N'Mũ cói thoáng mát', 'M001'),
(52, N'Mũ beret', 'mu12.jpg', 130000, 150000, 30, 0, N'Mũ beret kiểu Pháp', 'M001'),
(53, N'Mũ lưỡi trai vành rộng', 'mu13.jpg', 150000, 170000, 20, 1, N'Mũ lưỡi trai vành rộng', 'M001'),
(54, N'Mũ mì tây', 'mu14.jpg', 110000, 130000, 35, 0, N'Mũ mì tây cổ điển', 'M001'),
(55, N'Mũ tai gấu', 'mu15.jpg', 100000, 120000, 40, 0, N'Mũ tai gấu dễ thương', 'M001'),
(56, N'Mũ caro', 'mu16.jpg', 130000, 150000, 25, 1, N'Mũ caro họa tiết caro', 'M001');

-- Thêm 8 giày
INSERT INTO Products (Id, Name, Image, Sale, Price, Inventory, Sex, describe, CategoryId) VALUES
(57, N'Giày oxford', 'giay9.jpg', 650000, 700000, 20, 1, N'Giày oxford da bóng', 'G001'),
(58, N'Giày slip-on', 'giay10.jpg', 450000, 500000, 30, 1, N'Giày slip-on vải canvas', 'G001'),
(59, N'Giày loafer', 'giay11.jpg', 680000, 750000, 15, 0, N'Giày loafer da lộn', 'G001'),
(60, N'Giày ankle boot', 'giay12.jpg', 850000, 900000, 10, 0, N'Giày ankle boot da lộn', 'G001'),
(61, N'Giày thể thao cổ cao', 'giay13.jpg', 550000, 600000, 25, 1, N'Giày thể thao cổ cao', 'G001'),
(62, N'Giày lười da mềm', 'giay14.jpg', 420000, 450000, 35, 1, N'Giày lười da mềm', 'G001'),
(63, N'Giày búp bê', 'giay15.jpg', 380000, 420000, 20, 0, N'Giày búp bê da lộn', 'G001'),
(64, N'Giày mules', 'giay16.jpg', 520000, 550000, 30, 0, N'Giày mules gót cao', 'G001');

-- Thêm dữ liệu vào bảng Accounts
INSERT INTO Accounts (Username, Password, Fullname, Email, Photo, Admin) VALUES
('user1', 'pass1', N'Nguyễn Văn A', 'user1@example.com', 'user1.jpg', 0),
('user2', 'pass2', N'Trần Thị B', 'user2@example.com', 'user2.jpg', 0),
('user3', 'pass3', N'Lê Hoàng C', 'user3@example.com', 'user3.jpg', 0),
('admin', 'admin', N'Quản trị viên', 'admin@example.com', 'admin.jpg', 1);

INSERT INTO Orders (Id, Username, CreateDate, Address) VALUES
(1, '0987654322', '2023-04-06 08:00:00', N'123 Đường ABC, TP.HCM'),
(2, '0987654323', '2023-04-07 09:30:00', N'456 Đường XYZ, Hà Nội'),
(3, '0987654324', '2023-04-08 10:15:00', N'789 Đường QWE, Đà Nẵng'),
(4, '0373395605', '2023-04-09 11:45:00', N'321 Đường RTY, Cần Thơ'),
(5, '0979017171', '2023-04-10 14:00:00', N'654 Đường FGH, Nha Trang');

INSERT INTO OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES
(1, 1, 1, 300000, 2),
(2, 2, 17, 150000, 3),
(3, 3, 33, 440000, 2),
(4, 4, 41, 350000, 1),
(5, 5, 18, 160000, 2)

	select * from Orders
	select * from OrderDetails
	select * from Accounts

	INSERT INTO Orders (Id, Username, CreateDate, Address) VALUES
(1,'0987654322', '2023-04-06 08:00:00', N'123 Đường ABC, TP.HCM');



DROP TABLE OrderDetails;
DROP TABLE Orders;
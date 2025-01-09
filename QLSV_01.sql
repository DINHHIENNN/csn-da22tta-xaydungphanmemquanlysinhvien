CREATE DATABASE QLSV_01
USE QLSV_01
CREATE TABLE Khoa (
    MaKhoa VARCHAR(10) PRIMARY KEY, 
    TenKhoa NVARCHAR(100) NOT NULL,
	MoTa NVARCHAR(255),                    
    NamThanhLap INT NOT NULL
)
CREATE TABLE BoMon (
    MaBM VARCHAR(10) PRIMARY KEY,       
    TenBoMon NVARCHAR(100) NOT NULL,   
    MaKhoa VARCHAR(10) NOT NULL,      
	MoTaBM NVARCHAR(255),
    FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa) 
)
CREATE TABLE NganhHoc (
    MaNH VARCHAR(10) PRIMARY KEY,     
    TenNH NVARCHAR(100) NOT NULL,      
    MaBM VARCHAR(10) NOT NULL,         
    FOREIGN KEY (MaBM) REFERENCES BoMon(MaBM) 
)
select* from BoMon
CREATE TABLE KhoaHoc (
    MaKH VARCHAR(10) PRIMARY KEY,       
    TenKH NVARCHAR(100) NOT NULL,       
    NamHoc INT NOT NULL               
)
CREATE TABLE Lop (
    MaKH VARCHAR(10) NOT NULL,        
    MaNH VARCHAR(10) NOT NULL,         
    MaLop VARCHAR(10) PRIMARY KEY,     
    TenLop NVARCHAR(50) NOT NULL,    
    FOREIGN KEY (MaKH) REFERENCES KhoaHoc(MaKH), 
    FOREIGN KEY (MaNH) REFERENCES NganhHoc(MaNH)
)
CREATE TABLE TinhThanh (
    MaTT VARCHAR(10) PRIMARY KEY,      
    TenTT NVARCHAR(50) NOT NULL       
)
CREATE TABLE HuyenThi(
    MaHT VARCHAR(10) PRIMARY KEY,       
    MaTT VARCHAR(10) NOT NULL,           
    TenHT NVARCHAR(50) NOT NULL,      
    FOREIGN KEY (MaTT) REFERENCES TinhThanh(MaTT) 
)
select *from huyenthi
CREATE TABLE PhuongXa (
    MaPXa VARCHAR(10) PRIMARY KEY,          
    TenPXa NVARCHAR(50) NOT NULL,          
    MaHT VARCHAR(10) NOT NULL,      
	MaTT varchar(10) not null
    FOREIGN KEY (MaHT) REFERENCES HuyenThi(MaHT),
	FOREIGN KEY (MaTT) REFERENCES TinhThanh(MaTT) 
)
SELECT *  from SINHVIEN
CREATE TABLE SinhVien (
    MaSV VARCHAR(10) PRIMARY KEY,        
    HoSV NVARCHAR(50) NOT NULL,           
    TenSV NVARCHAR(50) NOT NULL,         
    GioiTinh NVARCHAR(10) NOT NULL,           
    NgaySinh DATE NOT NULL,               
    Email NVARCHAR(50) NOT NULL,        
    SoDienThoai VARCHAR(20) NOT NULL,     
    NoiSinh NVARCHAR(100) NOT NULL,       
    DiaChi NVARCHAR(255) NOT NULL,       
    MaLop VARCHAR(10) NOT NULL,          
    MaPXa VARCHAR(10) NOT NULL,
	MaHT VARCHAR(10) NOT NULL,          
    MaTT VARCHAR(10) NOT NULL,
	MaKhoa varchar (10) not null
    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop),
    FOREIGN KEY (MaPXa) REFERENCES PhuongXa(MaPXa),
	FOREIGN KEY (MaHT) REFERENCES HuyenThi(MaHT),
    FOREIGN KEY (MaTT) REFERENCES TinhThanh(MaTT),
	FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
)
--thay đổi ldl tên lớp
ALTER TABLE Lop
ALTER COLUMN TenLop NVARCHAR(255);
delete lop
EXEC SP_RENAME 'SinhVien.Gioi', 'GioiTinh', 'COLUMN';
Select * from lop
Select * from PhuongXa
INSERT INTO Khoa (MaKhoa, TenKhoa, MoTa, NamThanhLap)
VALUES
('K_01', N'Khoa Ngoại ngữ', N'Giảng dạy các ngoại ngữ như tiếng Anh, tiếng Trung, tiếng Nhật, v.v., giúp sinh viên giao tiếp quốc tế và phát triển nghề nghiệp trong môi trường toàn cầu.', 2012),
('K_02', N'Khoa Sư phạm', N'Đào tạo giáo viên các cấp học, từ mầm non đến trung học, cùng các ngành nghề liên quan đến giáo dục, giảng dạy, và phát triển kỹ năng giảng dạy.', 2016),
('K_03', N'Khoa Kinh tế – Luật', N'Giảng dạy các chuyên ngành kinh tế, quản trị, tài chính, luật và các lĩnh vực khác liên quan đến chính trị, xã hội và phát triển kinh tế.', 2015),
('K_04', N'Khoa Nông nghiệp – Thủy sản', N'Đào tạo và nghiên cứu các ngành về nông nghiệp, thủy sản, bảo vệ môi trường, và phát triển nông thôn bền vững.', 2018),
('K_05', N'Khoa Kỹ thuật và Công nghệ', N'Giảng dạy các lĩnh vực kỹ thuật, công nghệ thông tin, điện tử, cơ khí, và phát triển các ứng dụng công nghệ trong đời sống xã hội.', 2013);
INSERT INTO BoMon (MaBM, TenBoMon, MoTaBM, MaKhoa)
VALUES
('BM_01', N'Bộ môn Giáo dục tiểu học', N'Đào tạo giáo viên cho bậc tiểu học, trang bị kiến thức và kỹ năng giảng dạy cho giáo viên, giúp họ phát triển phương pháp giáo dục hiệu quả cho học sinh tiểu học.', 'K_02'),
('BM_02', N'Bộ môn Giáo dục mầm non', N'Chuyên đào tạo giáo viên mầm non, cung cấp kiến thức về chăm sóc, nuôi dạy trẻ và phương pháp giáo dục trẻ em ở độ tuổi mầm non.', 'K_02'),
('BM_03', N'Bộ môn Tiếng Anh', N'Cung cấp kiến thức về ngôn ngữ Tiếng Anh, đào tạo các kỹ năng giao tiếp, dịch thuật, và giảng dạy tiếng Anh cho các đối tượng học viên khác nhau.', 'K_01'),
('BM_04', N'Bộ môn Quản trị tài chính', N'Đào tạo các kiến thức chuyên sâu về tài chính, quản lý tài sản, đầu tư và kế toán cho sinh viên, giúp họ có nền tảng vững chắc trong việc quản lý tài chính cá nhân và doanh nghiệp.', 'K_03'),
('BM_05', N'Bộ môn Kinh tế và kinh doanh', N'Cung cấp kiến thức về các nguyên lý cơ bản của kinh tế học và các kỹ năng quản lý kinh doanh, giúp sinh viên phát triển khả năng lãnh đạo và quản trị trong các tổ chức.', 'K_03'),
('BM_06', N'Bộ môn Luật', N'Đào tạo các sinh viên chuyên ngành luật, cung cấp kiến thức về hệ thống pháp luật, quy định và thực tiễn trong các lĩnh vực pháp lý, bao gồm dân sự, hình sự, thương mại.', 'K_03'),
('BM_07', N'Bộ môn Nông nghiệp', N'Giảng dạy các lĩnh vực liên quan đến sản xuất nông nghiệp, bao gồm các kỹ thuật trồng trọt, chăm sóc cây trồng, bảo vệ môi trường và phát triển bền vững trong ngành nông nghiệp.', 'K_04'),
('BM_08', N'Bộ môn Chăn nuôi thú y', N'Đào tạo các chuyên gia về chăn nuôi, thú y, từ nghiên cứu về các bệnh dịch trong động vật đến các phương pháp nuôi dưỡng và chăm sóc gia súc, gia cầm.', 'K_04'),
('BM_09', N'Bộ môn Khoa học cây trồng', N'Đào tạo sinh viên về các kỹ thuật nghiên cứu và ứng dụng trong việc phát triển, chăm sóc và bảo vệ cây trồng trong nông nghiệp.', 'K_04'),
('BM_010', N'Bộ môn Thủy sản', N'Cung cấp kiến thức và kỹ năng trong ngành thủy sản, từ nuôi trồng thủy sản, quản lý nguồn nước, đến các phương pháp đánh bắt và bảo vệ nguồn lợi thủy sản.', 'K_04'),
('BM_011', N'Bộ môn Công nghệ thông tin', N'Đào tạo sinh viên trong lĩnh vực công nghệ thông tin, bao gồm lập trình, phát triển phần mềm, bảo mật mạng, dữ liệu lớn và các ứng dụng công nghệ hiện đại trong xã hội.', 'K_05'),
('BM_012', N'Bộ môn Cơ khí - Động lực', N'Giảng dạy các kiến thức về cơ khí, động lực học, thiết kế và chế tạo máy móc, hệ thống cơ điện, cũng như các kỹ thuật phục vụ các ngành công nghiệp chế tạo.', 'K_05'),
('BM_013', N'Bộ môn Xây dựng', N'Đào tạo sinh viên trong các lĩnh vực xây dựng, từ thiết kế công trình, kiến trúc, đến quản lý dự án và ứng dụng các kỹ thuật xây dựng hiện đại trong các dự án dân dụng và công nghiệp.', 'K_05');

INSERT INTO NganhHoc (MaNH, TenNH, MaBM)
VALUES 
('NH_01', N'Ngôn ngữ Anh', 'BM_03'),
('NH_02', N'Giáo dục mầm non', 'BM_02'),
('NH_03', N'Giáo dục tiểu học', 'BM_01'),
('NH_04', N'Kinh tế', 'BM_05'),
('NH_05', N'Quản trị kinh doanh', 'BM_05'),
('NH_06', N'Tài chính - Ngân hàng', 'BM_04'),
('NH_07', N'Luật', 'BM_06'),
('NH_08', N'Thú y', 'BM_08'),
('NH_09', N'Nông nghiệp', 'BM_07'),
('NH_010', N'Nuôi trồng thủy sản', 'BM_010'),
('NH_011', N'Trí tuệ nhân tạo', 'BM_011'),
('NH_012', N'Công nghệ kỹ thuật cơ khí', 'BM_012'),
('NH_013', N'Công nghệ thông tin', 'BM_011'),
('NH_014', N'Công nghệ kỹ thuật ô tô', 'BM_012'),
('NH_015', N'Công nghệ kỹ thuật công trình xây dựng', 'BM_013');
INSERT INTO KhoaHoc (MaKH, TenKH, NamHoc)
VALUES 
('K2021', N'Khóa 2021', 2021),
('K2022', N'Khóa 2022', 2022),
('K2023', N'Khóa 2023', 2023),
('K2024', N'Khóa 2024', 2024);
Delete  SinhVien
INSERT INTO TinhThanh (MaTT, TenTT)
VALUES
('T01', N'Hà Nội'),
('T02', N'Hải Phòng'),
('T03', N'Quảng Nam'),
('T04', N'Đà Nẵng'),
('T05', N'Hồ Chí Minh'),
('T06', N'Cần Thơ'),
('T07', N'Nghệ An'),
('T08', N'Hà Tĩnh'),
('T09', N'Thái Bình'),
('T10', N'Hà Nam'),
('T11', N'Nam Định'),
('T12', N'Ninh Bình'),
('T13', N'Thanh Hóa'),
('T14', N'Quảng Bình'),
('T15', N'Quảng Trị'),
('T16', N'Thừa Thiên Huế'),
('T17', N'Quảng Nam'),
('T18', N'Quảng Ngãi'),
('T19', N'Bình Định'),
('T20', N'Phú Yên'),
('T21', N'Khánh Hòa'),
('T22', N'Đắk Lắk'),
('T23', N'Đắk Nông'),
('T24', N'Lâm Đồng'),
('T25', N'Bình Phước'),
('T26', N'Tây Ninh'),
('T27', N'Bình Dương'),
('T28', N'Đồng Nai'),
('T29', N'Bà Rịa - Vũng Tàu'),
('T30', N'Kiên Giang'),
('T31', N'Hậu Giang'),
('T32', N'Cà Mau'),
('T33', N'Sóc Trăng'),
('T34', N'Trà Vinh'),
('T35', N'Bến Tre'),
('T36', N'Vĩnh Long'),
('T37', N'Tiền Giang'),
('T38', N'Long An'),
('T39', N'An Giang'),
('T40', N'Đồng Tháp'),
('T41', N'Bình Thuận'),
('T42', N'Ninh Thuận'),
('T43', N'Lạng Sơn'),
('T44', N'Bắc Kạn'),
('T45', N'Thái Nguyên'),
('T46', N'Tuyên Quang'),
('T47', N'Hà Giang'),
('T48', N'Cao Bằng'),
('T49', N'Bắc Ninh'),
('T50', N'Hải Dương'),
('T51', N'Hưng Yên'),
('T52', N'Sơn La'),
('T53', N'Điện Biên'),
('T54', N'Lai Châu'),
('T55', N'Lào Cai'),
('T56', N'Yên Bái'),
('T57', N'Phú Thọ'),
('T58', N'Vĩnh Phúc'),
('T59', N'Quảng Ninh'),
('T60', N'Bắc Giang'),
('T61', N'Hòa Bình'),
('T62', N'Gia Lai'),
('T63', N'Kon Tum');
INSERT INTO HuyenThi (MaHT, MaTT, TenHT)
VALUES
('H01', 'T01', N'Quận Thanh Xuân'),
('H02', 'T02', N'Quận Lê Chân'),
('H03', 'T04', N'Quận Hải Châu'),
('H04', 'T06', N'Quận Ninh Kiều'),
('H05', 'T16', N'Thành phố Huế'),
('H06', 'T07', N'Thành phố Vinh'),
('H07', 'T11', N'Thành phố Nam Định'),
('H08', 'T13', N'Thành phố Thanh Hóa'),
('H09', 'T59', N'Thành phố Hạ Long'),
('H10', 'T19', N'Thành phố Quy Nhơn'),
('H11', 'T50', N'Thành phố Hải Dương'),
('H12', 'T60', N'Thành phố Bắc Giang'),
('H13', 'T05', N'Quận 1'),
('H14', 'T36', N'Thành phố Vĩnh Long'),
('H15', 'T44', N'Thành phố Bắc Kạn'),
('H16', 'T49', N'Thành phố Bắc Ninh'),
('H17', 'T45', N'Thành phố Thái Nguyên'),
('H18', 'T12', N'Thành phố Ninh Bình'),
('H19', 'T33', N'Thành phố Sóc Trăng'),
('H20', 'T03', N'Thành phố Tam Kỳ'),
('H21', 'T55', N'Thành phố Lào Cai'),
('H22', 'T14', N'Thành phố Đồng Hới'),
('H23', 'T21', N'Thành phố Nha Trang'),
('H24', 'T27', N'Thành phố Thủ Dầu Một'),
('H25', 'T38', N'Thành phố Tân An'),
('H26', 'T22', N'Thành phố Buôn Ma Thuột'),
('H27', 'T23', N'Thành phố Gia Nghĩa'),
('H28', 'T29', N'Thành phố Vũng Tàu'),
('H29', 'T26', N'Thành phố Tây Ninh'),
('H30', 'T32', N'Thành phố Cà Mau')
select*from lop
INSERT INTO PhuongXa (MaPXa, TenPXa, MaHT,MaTT)
VALUES
('PX01', N'Phường Khương Đình', 'H01','T01'),
('PX02', N'Phường Kênh Dương', 'H02','T02'),
('PX03', N'Phường Thạch Thang', 'H03','T04'),
('PX04', N'Phường An Cư', 'H04','T06'),
('PX05', N'Phường Phú Nhuận', 'H05','T16'),
('PX06', N'Phường Lê Mao', 'H06','T07'),
('PX07', N'Phường Lộc Vượng', 'H07','T11'),
('PX08', N'Phường Lam Sơn', 'H08','T13'),
('PX09', N'Phường Bãi Cháy', 'H09','T59'),
('PX010', N'Phường Quang Trung', 'H10','T19'),
('PX011', N'Phường Bình Hàn', 'H11','T50'),
('PX012', N'Phường Xương Giang', 'H12','T60'),
('PX013', N'Phường Bến Nghé', 'H13','T05'),
('PX014', N'Phường 1', 'H14','T36'),
('PX015', N'Phường Sông Cầu', 'H15','T44'),
('PX016', N'Phường Võ Cường', 'H16','T49'),
('PX017', N'Phường Hoàng Văn Thụ', 'H17','T45'),
('PX018', N'Phường Ninh Khánh', 'H18','T12'),
('PX019', N'Phường 1', 'H19','T33'),
('PX020', N'Phường An Mỹ', 'H20','T03'),
('PX021', N'Phường Kim Tân', 'H21','T55'),
('PX022', N'Phường Nam Lý', 'H22','T14'),
('PX023', N'Phường Lộc Thọ', 'H23','T21'),
('PX024', N'Phường Phú Cường', 'H24','T27'),
('PX025', N'Phường 4', 'H25','T38'),
('PX026', N'Phường Tân Lợi', 'H26','T22'),
('PX027', N'Phường Nghĩa Trung', 'H27','T23'),
('PX028', N'Phường 1', 'H28','T29'),
('PX029', N'Phường 2', 'H29','T26'),
('PX030', N'Phường 1', 'H30','T32');
INSERT INTO Lop (MaKH, MaNH, MaLop, TenLop)
VALUES
('K2021', 'NH_01', 'DA21NNA', N'Đại học Ngôn nhữ Anh khóa 21'),
('K2021', 'NH_02', 'DA21MN', N'Đại học Giáo dục mầm non khóa 21'),
('K2021', 'NH_03', 'DA21TH', N'Đại học Giáo dục tiểu học khóa 21'),
('K2021', 'NH_013', 'DA21TT', N'Đại học Công nghệ thông tin khóa 21'),
('K2021', 'NH_010', 'DA21NTTS', N'Đại học Nuôi trồng thủy sản khóa 21'),
('K2021', 'NH_04', 'DA21KT', N'Đại học Kinh tế khóa 21'),
('K2022', 'NH_05', 'DA22QTKD', N'Đại học Quản trị kinh doanh khóa 22'),
('K2022', 'NH_06', 'DA22TCNH', N'Đại học Tài chính ngân hàng khóa 22'),
('K2022', 'NH_07', 'DA22NL', N'Đại học Luật khóa 22'),
('K2022', 'NH_03', 'DA22TH', N'Đại học Giáo dục tiểu học khóa 22'),
('K2022', 'NH_02', 'DA22MN', N'Đại học Giáo dục mầm non khóa 22'),
('K2022', 'NH_08', 'DA22TY', N'Đại học Thú y khóa 22'),
('K2023', 'NH_09', 'DA23NN', N'Đại học Nông nghiệp khóa 23'),
('K2023', 'NH_010', 'DA23NTTS', N'Đại học Nuôi trồng thủy sản khóa 23'),
('K2023', 'NH_011', 'DA23TTNT', N'Đại học Trí tuệ nhân tạo khóa 23'),
('K2023', 'NH_01', 'DA23NNA', N'Đại học Ngôn ngữ Anh khóa 23'),
('K2023', 'NH_08', 'DA23TY', N'Đại học Thú y khóa 23'),
('K2023', 'NH_012', 'DA23KTCK', N'Đại học Công nghệ kỹ thuật cơ khí khóa 23'),
('K2024', 'NH_013', 'DA24TT', N'Đại học Công nghệ thông tin khóa 24'),
('K2024', 'NH_014', 'DA24KTOT', N'Đại học Công nghệ kỹ thuật ô tô khóa 24'),
('K2024', 'NH_05', 'DA24QTKD', N'Đại học Quản trị kinh doanh khóa 24'),
('K2024', 'NH_07', 'DA24NL', N'Đại học Luật khóa 24'),
('K2024', 'NH_015', 'DA24KTCTXD', N'Đại học Công nghệ kỹ thuật công trình xây dựng khóa 24'),
('K2024', 'NH_012', 'DA24KTCK', N'Đại học Công nghệ kỹ thuật cơ khí khóa 24');

INSERT INTO SinhVien (MaSV, HoSV, TenSV, GioiTinh, NgaySinh, Email, SoDienThoai, NoiSinh, DiaChi, MaLop, MaPXa,MaHT,MaTT,MaKhoa)
VALUES
('SV1', N'Nguyễn Khánh', N'An', N'Nam', '2002-10-12', 'an.nguyen@email.com', '912345678', N'Hà Nội', N'123 Nguyễn Trãi', 'DA21NNA', 'PX01','H01','T01','K_01'),
('SV2', N'Trần Thanh', N'Bình', N'Nam', '2005-02-23', 'binh.tran@email.com', '923456789', N'Hải Phòng', N'456 Lê Lợi', 'DA23NTTS', 'PX02','H02','T02','K_04'),
('SV3', N'Lê Thị', N'Mai', N'Nữ', '2003-04-03', 'mai.le@email.com', '934567890', N'Đà Nẵng', N'789 Hùng Vương', 'DA22QTKD', 'PX03','H03', 'T04','K_03'),
('SV4', N'Hoàng', N'Liên', N'Nữ', '2002-03-14', 'lien.hoang@email.com', '945678901', N'Cần Thơ', N'101 Nguyễn An Ninh', 'DA21MN', 'PX04', 'H04', 'T06','K_02'),
('SV5', N'Phạm', N'Tuấn', N'Nam', '2002-08-20', 'tuan.pham@email.com', '956789012', N'Huế', N'202 Trần Phú', 'DA21TH', 'PX05', 'H05', 'T16','K_02'),
('SV6', N'Vũ Thị', N'Hoa', N'Nữ', '2005-06-06', 'hoa.vu@email.com', '967890123', N'Vinh', N'303 Lê Duẩn', 'DA23TTNT', 'PX06', 'H06', 'T07','K_05'),
('SV7', N'Bùi Thanh', N'Khoa', N'Nam', '2003-12-09', 'khoa.bui@email.com', '978901234', N'Nam Định', N'404 Trần Hưng Đạo', 'DA22TCNH', 'PX07', 'H07', 'T11','K_03'),
('SV8', N'Nguyễn', N'Lan', N'Nữ', '2004-04-05', 'lan.nguyen@email.com', '989012345', N'Thanh Hóa', N'505 Quang Trung', 'DA22TY', 'PX08', 'H08', 'T13','K_04'),
('SV9', N'Trần Văn', N'Sơn', N'Nam', '2006-09-09', 'son.tran@email.com', '990123456', N'Quảng Ninh', N'606 Lê Hồng Phong', 'DA24KTCTXD', 'PX09', 'H09', 'T59','K_05'),
('SV10', N'Lê', N'Thu', N'Nữ', '2003-10-16', 'thu.le@email.com', '901234567', N'Bình Định', N'707 Nguyễn Văn Trỗi', 'DA23NTTS', 'PX010', 'H10', 'T19','K_04'),
('SV11', N'Hoàng', N'Tâm', N'Nam', '2002-01-19', 'tam.hoang@email.com', '912345678', N'Hải Dương', N'808 Lê Lợi', 'DA21TT', 'PX011', 'H11', 'T50','K_05'),
('SV12', N'Võ Thị', N'Nhi', N'Nữ', '2001-11-12', 'nhi.vo@email.com', '923456789', N'Bắc Giang', N'909 Trần Văn Nhỏ', 'DA21KT', 'PX012', 'H12', 'T60','K_03'),
('SV13', N'Nguyễn Hoàng', N'Minh', N'Nam', '2005-04-17', 'minh.nguyen@email.com', '934567890', N'TP. Hồ Chí Minh', N'101 Nguyễn Trãi', 'DA24KTCK', 'PX013', 'H13', 'T05','K_05'),
('SV14', N'Trần', N'Giang', N'Nam', '2004-07-08', 'giang.tran@email.com', '945678901', N'Vĩnh Long', N'202 Lê Thanh Tôn', 'DA22NL', 'PX014', 'H14', 'T36','K_03'),
('SV15', N'Lai Văn', N'Dương', N'Nam', '2006-08-20', 'duong.lai@email.com', '956789012', N'Bắc Kạn', N'303 Quang Trung', 'DA24KTOT', 'PX015', 'H15', 'T44','K_05'),
('SV16', N'Phạm', N'Quyên', N'Nữ', '2005-07-16', 'quyen.pham@email.com', '967890123', N'Bắc Ninh', N'404 Nguyễn Văn Thái', 'DA23NNA', 'PX016', 'H16', 'T49','K_01'),
('SV17', N'Nguyễn Hoàng', N'Phúc', N'Nam', '2004-06-29', 'phuc.hoang@email.com', '978901234', N'Thái Nguyên', N'505 Lê Thái Tổ', 'DA24QTKD', 'PX017', 'H17', 'T45','K_03'),
('SV18', N'Nguyễn Thị', N'Tuyết', N'Nữ', '2005-04-13', 'tuyet.nguyen@email.com', '989012345', N'Ninh Bình', N'606 Nguyễn Văn Cừ', 'DA24TT', 'PX018', 'H18', 'T12','K_05'),
('SV19', N'Bùi', N'Đạt', N'Nam', '2003-04-19', 'dat.bui@email.com', '990123456', N'Sóc Trăng', N'707 Quang Trung', 'DA23TY', 'PX019', 'H19', 'T33','K_04'),
('SV20', N'Vũ', N'Thành', N'Nữ', '2002-08-03', 'thanh.vu@email.com', '901234567', N'Quảng Nam', N'303 Quang Trung', 'DA21MN', 'PX020', 'H20', 'T03','K_02'),
('SV21', N'Nguyễn', N'Bích', N'Nam', '2002-01-01', 'annguyen@email.com', '901234500', N'Lào Cai', N'123 Láng Hạ', 'DA21NNA', 'PX021', 'H21', 'T55','K_01'),
('SV22', N'Lâm Thị', N'Bình', N'Nữ', '2003-02-02', 'Thibinh@email.com', '901234501', N'Quảng Bình', N'45 Kim Mã', 'DA23NTTS', 'PX022', 'H22', 'T14','K_04'),
('SV23', N'Nguyễn Văn', N'Chí', N'Nam', '2005-03-03', 'vanchi@email.com', '901234502', N'Khánh Hòa', N'67 Tràng Tiền', 'DA23TTNT', 'PX023', 'H23', 'T21','K_05'),
('SV24', N'Trần Thị', N'Dung', N'Nữ', '2003-08-20', 'Dung12@email.com', '901234503', N'Bình Dương', N'89 Nghĩa Tân', 'DA22TCNH', 'PX024', 'H24', 'T27','K_03'),
('SV25', N'Võ Thị', N'Em', N'Nam', '2002-05-05', 'vtem@email.com', '901234504', N'Long An', N'101 Khương Trung', 'DA21KT', 'PX025', 'H25', 'T38','K_03'),
('SV26', N'Nguyễn Văn', N'Phúc', N'Nữ', '2004-06-06', 'vanphuc@email.com', '901234505', N'Đắk Lắk', N'234 Láng Hạ', 'DA24KTOT', 'PX026', 'H26', 'T22','K_05'),
('SV27', N'Lai Thị', N'Linh', N'Nam', '2005-07-11', 'elinh@email.com', '901234506', N'Đắk Nông', N'56 Kim Mã', 'DA24KTCK', 'PX027', 'H27', 'T23','K_05'),
('SV28', N'Phạm Trung', N'Hiếu', N'Nữ', '2006-08-18', 'Trunghieu@email.com', '901234507', N'Bà Rịa - Vũng Tàu', N'78 Tràng Tiền', 'DA24KTCTXD', 'PX028','H28','T29','K_05'),
('SV29', N'Nguyễn', N'Tùng', N'Nam', '2002-09-02', 'Ntung@email.com', '901234508', N'Tây Ninh', N'90 Nghĩa Tân', 'DA21MN', 'PX029','H29','T26','K_02'),
('SV30', N'Lâm Yến', N'Linh', N'Nữ', '2005-10-10', 'YenLinh@email.com', '901234509', N'Cà Mau', N'112 Khương Trung', 'DA24TT', 'PX030','H30','T32','K_05');
select * from SinhVien


------------ Nguyễn Văn Thiện ----------------
DROP DATABASE IF EXISTS QuanLyDiemTHPT;

CREATE DATABASE QuanLyDiemTHPT;

USE QuanLyDiemTHPT;

CREATE TABLE KHOIHOC (
   MaKH VARCHAR(10) PRIMARY KEY,
   TenKH NVARCHAR(50)
);

CREATE TABLE LOPHOC (
    MaLH VARCHAR(10) PRIMARY KEY,
	TenLH NVARCHAR(100),
	MaKH VARCHAR(10),
	MaNH VARCHAR(10),
	MaGVCN VARCHAR(10)
);

CREATE TABLE HOCSINH (
    MaHS VARCHAR(10) PRIMARY KEY,
	MaLH VARCHAR(10),
	Ho NVARCHAR(255),
	Ten NVARCHAR(255),
	GioiTinh NVARCHAR(15),
	NgaySinh DATE,
	DiaChi NVARCHAR(100)
);

CREATE TABLE NAMHOC (
    MaNH VARCHAR(10) PRIMARY KEY,
	TenNH NVARCHAR(255),
	ThoiGianBatDau DATE,
	ThoiGianKetThuc DATE
);

CREATE TABLE HOCKY (
   MaHK VARCHAR(10) PRIMARY KEY,
   MaNH VARCHAR(10),
   TenHK NVARCHAR(100),
   ThoiGianBatDau DATE,
   ThoiGianKetThuc DATE
);

CREATE TABLE GIAOVIEN (
   MaGV VARCHAR(10) PRIMARY KEY,
   Ho NVARCHAR(255),
   Ten NVARCHAR(255),
   GioiTinh NVARCHAR(15),
   NgaySinh DATE,
   DiaChi NVARCHAR(100),
   SDT CHAR(15),
   Email VARCHAR(255),
   MatKhau VARCHAR(255),
   Role NVARCHAR(10)
);

CREATE TABLE QUANTRI (
	MaQT VARCHAR(10) PRIMARY KEY,
	Ho NVARCHAR(255),
	Ten NVARCHAR(255),
	Email VARCHAR(255),
	MatKhau VARCHAR(255),
	Role NVARCHAR(10)
);

CREATE TABLE MONHOC (
   MaMH VARCHAR(10) PRIMARY KEY,
   TenMH NVARCHAR(100)
);

CREATE TABLE PHANCONGGIANGDAY (
   MaPC VARCHAR(10) PRIMARY KEY,
   MaGV VARCHAR(10),
   MaLH VARCHAR(10),
   MaHK VARCHAR(10),
   MaMH VARCHAR(10),
   GhiChu TEXT
);

CREATE TABLE DIEM (
	MaDiem VARCHAR(10),
    MaHS VARCHAR(10),
	MaPC VARCHAR(10),
	DiemHe1 FLOAT,
	DiemHe2 FLOAT,
	DiemHe3 FLOAT,
	GhiChu TEXT,
	PRIMARY KEY (MaDiem)
);

ALTER TABLE LOPHOC ADD FOREIGN KEY(MaKH) REFERENCES KHOIHOC(MaKH);
ALTER TABLE LOPHOC ADD FOREIGN KEY(MaNH) REFERENCES NAMHOC(MaNH);
ALTER TABLE HOCSINH ADD FOREIGN KEY(MaLH) REFERENCES LOPHOC(MaLH);
ALTER TABLE DIEM ADD FOREIGN KEY(MaPC) REFERENCES PHANCONGGIANGDAY(MaPC);
ALTER TABLE HOCKY ADD FOREIGN KEY(MaNH) REFERENCES NAMHOC(MaNH);
ALTER TABLE PHANCONGGIANGDAY ADD FOREIGN KEY(MaGV) REFERENCES GIAOVIEN(MaGV);
ALTER TABLE PHANCONGGIANGDAY ADD FOREIGN KEY(MaHK) REFERENCES HOCKY(MaHK);
ALTER TABLE PHANCONGGIANGDAY ADD FOREIGN KEY(MaLH) REFERENCES LOPHOC(MaLH);
ALTER TABLE PHANCONGGIANGDAY ADD FOREIGN KEY(MaMH) REFERENCES MONHOC(MaMH);

INSERT INTO KHOIHOC (MaKH, TenKH)
VALUES
	('KH01', N'Khối 10'),
	('KH02', N'Khối 11'),
	('KH03', N'Khối 12');

INSERT INTO NAMHOC (MaNH, TenNH, ThoiGIanBatDau, ThoiGianKetThuc)
VALUES
	('NH001', N'Năm học 2019-2020', '2019-08-26', '2020-05-31'),
	('NH002', N'Năm học 2020-2021', '2020-09-07', '2021-05-22');

INSERT INTO GIAOVIEN (MaGV, Ho, Ten, GioiTinh, NgaySinh, DiaChi, SDT, Email, MatKhau, Role)
VALUES
	('GV001', N'Lê Văn', N'Năm', 'Nam', '1980-07-15', N'Cẩm Lệ', '0987654321', 'lvnam@ddt.com', '123', 'GVCN'),
	('GV002', N'Lâm Thị', N'Hùng', 'Nam', '1975-06-23', N'Hoà Xuân', '0987654322', 'lthung@ddt.com', '123', 'GVCN'),
	('GV003', N'Dương Phương', N'Thu', N'Nữ', '1965-03-22', N'Liên Chiểu', '0987654323', 'dpthu@ddt.com', '123', 'GVCN'),
	('GV004', N'Lâm Thị Thùy', N'Ngân', N'Nữ', '1981-12-05', N'Hoà Cường', '0987654324', 'lttngan@ddt.com', '123', 'GVCN'),
	('GV005', N'Trần Hữu', N'Quyết', 'Nam', '1991-11-24', N'Sơn Trà', '0987654325', 'thquyet@ddt.com', '123', 'GVCN'),
	('GV006', N'Nông Thị', N'Thục', N'Nữ', '1991-12-14', N'Hải Châu', '0987654326', 'ntthuc@ddt.com', '123', 'GVCN'),
	('GV007', N'Đoàn Thị', N'Dung', N'Nữ', '1990-09-26', N'Thanh Khê', '0987654327', 'dtdung@ddt.com', '123', 'GVCN'),
	('GV008', N'Nông Thị', N'Tuyền', N'Nữ', '1984-04-15', N'Hoà Vang', '0987654328', 'nttuyen@ddt.com', '123', 'GVCN'),
	('GV009', N'Nguyễn Văn', N'Hùng', 'Nam', '1981-03-20', N'Hoà Khánh', '0987654329', 'nvhung@ddt.com', '123', 'GVCN'),
	('GV010', N'Lê Thu', N'Huyền', N'Nữ', '1978-06-23', N'Liên Chiểu', '0987654320', 'lthuyen@ddt.com', '123', 'GVCN'),
	('GV011', N'Nguyễn Thị', N'Hà', N'Nữ', '1982-08-25', N'Hoà Cường', '0987654331', 'ntha@ddt.com', '123', 'GVCN'),
	('GV012', N'Triệu Thị', N'Vinh', N'Nữ', '1989-12-25', N'Sơn Trà', '0987654332', 'ttvinh@ddt.com', '123', 'GVCN'),
	('GV013', N'Phạm Tùng', N'Lâm', 'Nam', '1984-04-06', N'Hải Châu', '0987654333', 'ptlam@ddt.com', '123', 'GVCN'),
	('GV014', N'Phạm Thị Thu', N'Hà', N'Nữ', '1991-12-01', N'Thanh Khê', '0987654334', 'pttha@ddt.com', '123', 'GVCN'),
	('GV015', N'Trương Thị', N'Thủy', N'Nữ', '1989-06-18', N'Hoà Vang', '0987654335', 'ttthuy@ddt.com', '123', 'GVCN'),
	('GV016', N'Đoàn Thị', N'Phương', N'Nữ', '1988-09-16', N'Hoà Khánh', '0987654336', 'dtphuong@ddt.com', '123', ''),
	('GV017', N'Âu Thị', N'Hạnh', N'Nữ', '1964-08-06', N'Liên Chiểu', '0987654337', 'athanh@ddt.com', '123', ''),
    ('GV018', N'Nguyễn Phan Minh', N'Thư', N'Nữ', '1972-02-13', N'Liên Chiểu', '0989828383', 'npmthu@ddt.com', '123', 'admin');
   
INSERT INTO LOPHOC (MaLH, TenLH, MaKH, MaNH, MaGVCN)
VALUES
	('LH001', N'Lớp 10A1', 'KH01', 'NH001', 'GV001'),
	('LH002', N'Lớp 10A2', 'KH01', 'NH001', 'GV002'),
	('LH003', N'Lớp 10A3', 'KH01', 'NH001', 'GV003'),
	('LH004', N'Lớp 10A4', 'KH01', 'NH001', 'GV004'),
	('LH005', N'Lớp 10A5', 'KH01', 'NH001', 'GV005'),
	('LH006', N'Lớp 11A1', 'KH02', 'NH001', 'GV006'),
	('LH007', N'Lớp 11A2', 'KH02', 'NH001', 'GV007'),
	('LH008', N'Lớp 11A3', 'KH02', 'NH001', 'GV008'),
	('LH009', N'Lớp 11A4', 'KH02', 'NH001', 'GV009'),
	('LH010', N'Lớp 11A5', 'KH02', 'NH001', 'GV010'),
	('LH011', N'Lớp 12A1', 'KH03', 'NH001', 'GV011'),
	('LH012', N'Lớp 12A2', 'KH03', 'NH001', 'GV012'),
	('LH013', N'Lớp 12A3', 'KH03', 'NH001', 'GV013'),
	('LH014', N'Lớp 12A4', 'KH03', 'NH001', 'GV014'),
	('LH015', N'Lớp 12A5', 'KH03', 'NH001', 'GV015');

INSERT INTO HOCKY (MaHK, MaNH, TenHK, ThoiGIanBatDau, ThoiGianKetThuc)
VALUES
	('HK001', 'NH001', N'Kỳ I 2019-2020', '2019-08-26', '2019-12-28'),
	('HK002', 'NH001', N'Kỳ II 2019-2020', '2019-12-30', '2020-05-31'),
	('HK003', 'NH002', N'Kỳ I 2020-2021', '2020-09-07', '2021-01-09'),
	('HK004', 'NH002', N'Kỳ II 2020-2021', '2021-01-11', '2021-05-22');

INSERT INTO HOCSINH (MaHS, MaLH, Ho, Ten, GioiTinh, NgaySinh, DiaChi)
VALUES
	('HS0001', 'LH001', N'Nguyễn Văn', N'Hậu', 'Nam', '2003-06-12', N'Hải Châu'),
	('HS0002', 'LH001', N'Trần Thị', N'Nghĩa', 'Nam', '2003-12-01', N'Liên Chiểu');

INSERT INTO MONHOC (MaMH, TenMH)
VALUES
	('MH01', N'Toán'),
	('MH02', N'Vật Lý'),
	('MH03', N'Hóa Học'),
	('MH04', N'Sinh Học'),
	('MH05', N'Ngữ Văn'),
	('MH06', N'Lịch Sử'),
	('MH07', N'Địa Lý'),
	('MH08', N'Tin Học'),
	('MH09', N'Công Nghệ'),
	('MH10', N'Giáo Dục Công Dân'),
	('MH11', N'Tiếng Anh'),
	('MH12', N'Quốc Phòng - An Ninh');

INSERT INTO PHANCONGGIANGDAY (MaPC, MaGV, MaLH, MaHK, MaMH, GhiChu)
VALUES
	('PC0001', 'GV005', 'LH001', 'HK001', 'MH07', ''),
	('PC0002', 'GV005', 'LH002', 'HK001', 'MH04', ''),
	('PC0003', 'GV005', 'LH003', 'HK001', 'MH05', ''),
	('PC0004', 'GV001', 'LH004', 'HK001', 'MH01', ''),
	('PC0005', 'GV002', 'LH005', 'HK001', 'MH02', ''),
	('PC0006', 'GV004', 'LH006', 'HK001', 'MH03', ''),
	('PC0007', 'GV008', 'LH007', 'HK001', 'MH09', ''),
	('PC0008', 'GV006', 'LH008', 'HK001', 'MH08', ''),
	('PC0009', 'GV009', 'LH009', 'HK001', 'MH10', ''),
	('PC0010', 'GV010', 'LH010', 'HK001', 'MH11', ''),
	('PC0011', 'GV014', 'LH011', 'HK001', 'MH06', ''),
	('PC0012', 'GV012', 'LH012', 'HK001', 'MH12', ''),
	('PC0013', 'GV013', 'LH013', 'HK001', 'MH07', ''),
	('PC0014', 'GV015', 'LH014', 'HK001', 'MH06', ''),
	('PC0015', 'GV011', 'LH015', 'HK001', 'MH09', '');

INSERT INTO DIEM (MaDiem, MaHS, MaPC, DiemHe1, DiemHe2, DiemHe3, GhiChu)
VALUES
	('D0001', 'HS0001', 'PC0001', 8.0, 6.5, 7.7, ''),
	('D0002', 'HS0002', 'PC0001', 4.5, 5.9, 6.5, ''),
	('D0003', 'HS0003', 'PC0002', 6.0, 7.5, 7.0, ''),
	('D0004', 'HS0004', 'PC0002', 9.0, 6.5, 8.5, ''),
	('D0005', 'HS0005', 'PC0003', 5.6, 4.5, 7.0, ''),
	('D0006', 'HS0006', 'PC0003', 8.0, 6.0, 7.0, ''),
	('D0007', 'HS0007', 'PC0004', 3.4, 7.0, 5.5, ''),
	('D0008', 'HS0008', 'PC0004', 8.0, 6.5, 7.7, ''),
	('D0009', 'HS0009', 'PC0005', 8.0, 6.5, 7.7, ''),
	('D0010', 'HS0010', 'PC0005', 8.0, 6.5, 7.7, ''),
	('D0011', 'HS0001', 'PC0006', 8.0, 6.5, 7.7, ''),
	('D0012', 'HS0002', 'PC0006', 4.5, 5.9, 6.5, ''),
	('D0013', 'HS0003', 'PC0007', 6.0, 7.5, 7.0, ''),
	('D0014', 'HS0004', 'PC0007', 9.0, 6.5, 8.5, ''),
	('D0015', 'HS0005', 'PC0008', 5.6, 4.5, 7.0, ''),
	('D0016', 'HS0006', 'PC0008', 8.0, 6.0, 7.0, ''),
	('D0017', 'HS0007', 'PC0009', 3.4, 7.0, 5.5, ''),
	('D0018', 'HS0008', 'PC0009', 8.0, 6.5, 7.7, ''),
	('D0019', 'HS0009', 'PC0010', 8.0, 6.5, 7.7, ''),
	('D0020', 'HS0010', 'PC0010', 8.0, 6.5, 7.7, ''),
	('D0021', 'HS0001', 'PC0011', 8.0, 6.5, 7.7, ''),
	('D0022', 'HS0002', 'PC0011', 4.5, 5.9, 6.5, ''),
	('D0023', 'HS0003', 'PC0012', 6.0, 7.5, 7.0, ''),
	('D0024', 'HS0004', 'PC0012', 9.0, 6.5, 8.5, ''),
	('D0025', 'HS0005', 'PC0013', 5.6, 4.5, 7.0, ''),
	('D0026', 'HS0006', 'PC0013', 8.0, 6.0, 7.0, ''),
	('D0027', 'HS0007', 'PC0014', 3.4, 7.0, 5.5, ''),
	('D0028', 'HS0008', 'PC0014', 8.0, 6.5, 7.7, ''),
	('D0029', 'HS0009', 'PC0015', 8.0, 6.5, 7.7, ''),
	('D0030', 'HS0010', 'PC0015', 8.0, 6.5, 7.7, '');
    
update diem
set diemhe1 = 9, diemhe2 = 10, diemhe3 = 8
where madiem = 'D0030';

------------ Lê Đức Thắng ----------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_good_student`()
	SELECT  *,((diemHe1+diemHe2*2+diemHe3*3)/6) as tongdiem FROM diem 
    WHERE ((diemHe1+diemHe2*2+diemHe3*3)/6) > 7.9 
    GROUP BY MaHS  
    ORDER BY tongdiem DESC $$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_3_student_score`()
SELECT  * FROM diem 
GROUP BY MaHS 
ORDER BY DiemHe3 DESC, DiemHe2 DESC, DiemHe1 DESC 
LIMIT 3 $$
DELIMITER ;

------------ Nguyễn Phan Minh Thư ----------------
-- Tạo thủ tục trả về bảng chứa danh sách phân công của giáo viên bộ môn nào đó
DELIMITER //
drop procedure if exists DanhSachMon //

create procedure DanhSachMon(id varchar(10))
begin
	select mapc, magv, malh, mahk, mamh, ghichu from phanconggiangday pcgd
    where pcgd.magv = id;
end //
DELIMITER ;

call DanhSachMon('GV001');

-- Tạo thủ tục trả về danh sách học sinh của một lớp nào đó
DELIMITER //
drop procedure if exists DanhSachLop //

create procedure DanhSachLop(maLH varchar(10))
begin
	select hs.* from hocsinh hs
    where hs.MaLH = maLH;
end //
DELIMITER ;

call DanhSachLop('LH001');

-- Tạo thủ tục trả về danh sách điểm được nhập gần đây của một giáo viên nào đó
DELIMITER //
drop procedure if exists DanhSachDiem //

create procedure DanhSachDiem(id varchar(10))
begin
	select d.* from diem d
    inner join phanconggiangday pcgd on pcgd.MaPC = d.MaPC
    where MaGV = id
    order by MaDiem desc
    limit 10;
    
end //
DELIMITER ;

call DanhSachDiem('GV005');

-- Tạo hàm trả về số lượng học phần mà giáo viên nào đó đã phụ trách
DELIMITER //
drop function if exists TongSoHP //

create function TongSoHP(id varchar(10))
returns int
DETERMINISTIC
begin
	declare tong int;
    set tong = 0;
    
	select count(MaPC) into tong from phanconggiangday pcgd
 	where MaGV = id;
    
    return tong;
end //

DELIMITER ;

select TongSoHP('GV005');

-- Tạo hàm trả về số lượng học phần mà giáo viên nào đó đang phụ trách trong
-- học kỳ hiện tại
DELIMITER //
drop function if exists TongSoHPDangPT //

create function TongSoHPDangPT(id varchar(10))
returns int
DETERMINISTIC
begin
	declare tong int;
    set tong = 0;
    
	select count(MaPC) into tong from phanconggiangday pcgd
    inner join hocky hk on hk.MaHK = pcgd.MaHK
 	where MaGV = id and hk.ThoiGianBatDau <= curdate() and hk.ThoiGianKetThuc >= curdate();
    
    return tong;
end //

DELIMITER ;

select TongSoHPDangPT('GV005');

-- Tạo hàm trả về tổng số môn học mà giáo viên nào đó đã dạy
DELIMITER //
drop function if exists TongSoMH //

create function TongSoMH(id varchar(10))
returns int
DETERMINISTIC
begin
	declare tong int;
    set tong = 0;
    
	select count(distinct MaMH) into tong from phanconggiangday pcgd
 	where MaGV = id;
    
    return tong;
end //

DELIMITER ;

select TongSoMH('GV001');

-- Tạo hàm trả về tổng số học sinh của một lớp
DELIMITER //
drop function if exists TongHS //

create function TongHS(id varchar(10))
returns int
DETERMINISTIC
begin
	declare tong int;
    set tong = 0;
    
	select count(distinct MaHS) into tong from hocsinh hs
 	where MaLH = id;
    
    return tong;
end //

DELIMITER ;

/*
-- Tạo trigger cho sự kiện thêm mới kì học, với điều kiện thời gian bắt đầu
-- và kết thúc của kì học phải nằm trong thời gian bắt đầu và kết thúc
-- của năm học.

create trigger insertHocKi
on HocKy
for insert
as
	begin
		declare @batDauKy date, @ketThucKy date, 
			@batDauNam date, @ketThucNam date
		declare @maNH varchar(10)

		select @batDauKy = ThoiGianBatDau, @ketThucKy = ThoiGianKetThuc, @maNH = MaNH from inserted
		select @batDauNam = ThoiGianBatDau, @ketThucNam = ThoiGianKetThuc from NAMHOC
		where MaNH = @maNH

		if not ((@batDauKy < @ketThucKy)
			and (@batDauKy between @batDauNam and @ketThucNam)
			and (@ketThucKy between @batDauNam and @ketThucNam))
			begin
				print 'Thoi gian khong hop le!'
				rollback transaction
			end
	end

INSERT INTO HOCKY (MaHK, MaNH, TenHK, ThoiGIanBatDau, ThoiGianKetThuc)
VALUES
	('HK005', 'NH001', 'Ki I 2019-2020', '2018-08-26', '2019-12-28')

-- Tạo trigger cho sự kiện thay đổi điểm của học sinh, mỗi khi thay đổi thì thêm 
-- vào ghi chú dòng "Sửa điểm hệ ... từ ... thành ..."

create trigger updateDiem
on DIEM
for update
as
	if update(DiemHe1)
		begin
			declare @ghiChu nvarchar(100), @diem1 float, @diem2 float
			select @diem1 = DiemHe1 from deleted
			select @diem2 = DiemHe1 from inserted
			set @ghiChu = concat('Sua diem he 1 tu ', convert(nvarchar, @diem1), ' thanh ', convert(nvarchar, @diem2))

			update DIEM
			set GhiChu = concat(GhiChu, '; ', @ghiChu)
			where MaPC = (select MaPC from inserted)
		end
	else if update(DiemHe2)
		begin
			select @diem1 = DiemHe2 from deleted
			select @diem2 = DiemHe2 from inserted
			set @ghiChu = concat('Sua diem he 1 tu ', convert(nvarchar, @diem1), ' thanh ', convert(nvarchar, @diem2))

			update DIEM
			set GhiChu = concat(GhiChu, '; ', @ghiChu)
			where MaPC = (select MaPC from inserted)
		end
	else if update(DiemHe3)
		begin
			select @diem1 = DiemHe3 from deleted
			select @diem2 = DiemHe3 from inserted
			set @ghiChu = concat('Sua diem he 1 tu ', convert(nvarchar, @diem1), ' thanh ', convert(nvarchar, @diem2))

			update DIEM
			set GhiChu = concat(GhiChu, '; ', @ghiChu)
			where MaPC = (select MaPC from inserted)
		end

drop trigger updateDiem

update DIEM
set DiemHe1 = 7.9
where MaHS = 'HS0001' and MaPC = 'PC0001'

select * from DIEM
where MaHS = 'HS0001'
*/
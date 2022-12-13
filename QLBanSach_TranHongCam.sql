CREATE DATABASE QLBanSach;

USE QLBanSach;

CREATE TABLE KhachHang (
	maKH varchar(10) not null PRIMARY KEY,
    taiKhoan varchar(20) not null,
    matKhau varchar(20) not null,
    email varchar(30) not null,
    diaChi varchar(100),
    hoTen varchar(40),
    ngaySinh date,
    gioiTinh boolean,
    dienThoai int
   );


CREATE TABLE DonHang (
	maDonHang varchar(20) not null PRIMARY KEY,
    daThanhToan boolean,  
    ngayGiao date,
	ngayDat date,
    tinhTrangGH boolean,
    maKH varchar(10),
	FOREIGN KEY (maKH) REFERENCES KhachHang(maKH)
);

CREATE TABLE ChuDe (
	maChuDe varchar(10) PRIMARY KEY,
    tenChuDe varchar(30)
);

CREATE TABLE NhaXuatBan (
	maNSX varchar(20) PRIMARY KEY,
    tenNSB varchar(40),
    diaChi varchar(100),
    dienThoai int
);

CREATE TABLE Sach (
	maSach varchar(20) PRIMARY KEY,
	tenSach varchar(100),
    maChuDe varchar(10),
    maNSX varchar(20),
    soLuongTon int,
    ngayCapNhat date,
    anhBia varchar(30),
    moTa varchar(100),
    giaBan int(10),
    FOREIGN KEY (maChuDe) REFERENCES ChuDe(maChuDe),
    FOREIGN KEY (maNSX) REFERENCES NhaXuatBan(maNSX)
);

CREATE TABLE DonHang_Sach (
	ma_DonHang_Sach varchar(20)  PRIMARY KEY,
	maDonHang varchar(20),
    maSach varchar(20),
    soLuong int,
    donGia long,
    FOREIGN KEY (maDonHang) REFERENCES DonHang(maDonHang),
    FOREIGN KEY (maSach) REFERENCES Sach(maSach)
);
CREATE TABLE TacGia (
	maTacGia varchar(20) PRIMARY KEY,
    tenTacGia varchar(40),
    diaChi varchar(100),
    tieuSu varchar(200),
    dienThoai int
);
CREATE TABLE TacGia_Sach (
    maSach_TG varchar(20) PRIMARY KEY,
	maTacGia varchar(20),
    maSach varchar(20),
    vaiTro varchar(50),
    viTri varchar(50),
    FOREIGN KEY (maTacGia) REFERENCES TacGia(maTacGia),
    FOREIGN KEY (maSach) REFERENCES Sach(maSach)
);

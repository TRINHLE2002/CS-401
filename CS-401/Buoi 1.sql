CREATE DATABASE QLNN;
USE QLNN;

CREATE TABLE Phong (
    ma_phong CHAR(10) PRIMARY KEY NOT NULL,
    ten_phong NVARCHAR(50) NOT NULL,
    dia_diem NVARCHAR(100),
    so_nhan_vien INT CHECK (so_nhan_vien >= 0)
);

CREATE TABLE nhan_vien (
    ma_nv CHAR(10) PRIMARY KEY,
    ho_lot NVARCHAR(50) NOT NULL,
    ten_nhan_vien NVARCHAR(20) NOT NULL,
    sdt VARCHAR(20),
    ma_phong CHAR(10) NOT NULL,
    FOREIGN KEY (ma_phong) REFERENCES Phong(ma_phong)
);

CREATE TABLE du_an (
    ma_du_an CHAR(10) PRIMARY KEY NOT NULL,
    ten_du_an NVARCHAR(100) NOT NULL,
    kinh_phi FLOAT CHECK (kinh_phi >= 0)
);

CREATE TABLE nvda (
    ma_nhan_vien CHAR(10) NOT NULL,
    ma_du_an CHAR(10) NOT NULL,
    so_gio INT CHECK (so_gio >= 0),
    PRIMARY KEY (ma_nhan_vien, ma_du_an),
    FOREIGN KEY (ma_du_an) REFERENCES du_an(ma_du_an),
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nv)
);

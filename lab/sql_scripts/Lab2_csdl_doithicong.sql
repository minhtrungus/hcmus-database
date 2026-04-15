CREATE SCHEMA csdl_doithicong;
USE csdl_doithicong;

CREATE TABLE CONGNHAN(
    MaCN           INT          NOT NULL,
    Ho             VARCHAR(15)  NOT NULL,
    Dem            VARCHAR(15),
    Ten            VARCHAR(15)  NOT NULL,
    NgaySinh       DATE,
    GioiTinh       CHAR(1),
    HangCN         INT,
    NgayTuyenDung  DATE,
    MaDoi          INT,
    CONSTRAINT PK_CONGNHAN
        PRIMARY KEY (MaCN)
);

CREATE TABLE HANG(
    HangCN     INT         NOT NULL,
    HeSoLuong  DECIMAL(3,1) NOT NULL,
    CONSTRAINT PK_HANG
        PRIMARY KEY (HangCN)
);

CREATE TABLE CONGTRINH(
    MaCT       INT         NOT NULL,
    TenCT      VARCHAR(64) NOT NULL,
    DiaDiem    VARCHAR(64),
    DonviChinh INT,
    CONSTRAINT PK_CONGTRINH
        PRIMARY KEY (MaCT)
);

CREATE TABLE DOITHICONG(
    MaDoi      INT         NOT NULL,
    DoiTruong  INT,
    ThuocDonVi INT,
    CONSTRAINT PK_DOITHICONG
        PRIMARY KEY (MaDoi)
);

CREATE TABLE CHAMCONG(
    MaCT       INT         NOT NULL,
    MaDoi      INT         NOT NULL,
    MaCN       INT         NOT NULL,
    NgayLamViec DATE      NOT NULL,
    SoGio      DECIMAL(4,1),
    CONSTRAINT PK_CHAMCONG
        PRIMARY KEY (MaCT)
);

ALTER TABLE CONGNHAN
    ADD CONSTRAINT FK_CN_HANG
        FOREIGN KEY (HangCN) REFERENCES HANG (HangCN);

ALTER TABLE CONGNHAN
    ADD CONSTRAINT FK_CN_DOITHICONG
        FOREIGN KEY (MaDoi) REFERENCES DOITHICONG (MaDoi);

ALTER TABLE DOITHICONG
    ADD CONSTRAINT FK_DTC_CONGNHAN
        FOREIGN KEY (DoiTruong) REFERENCES CONGNHAN (MaCN);

ALTER TABLE CHAMCONG
    ADD CONSTRAINT FK_CC_DOITHICONG
        FOREIGN KEY (MaDoi) REFERENCES DOITHICONG (MaDoi);

ALTER TABLE CHAMCONG
    ADD CONSTRAINT FK_CC_CONGNHAN
        FOREIGN KEY (MaCN) REFERENCES CONGNHAN (MaCN);

INSERT INTO HANG (HangCN, HeSoLuong)
VALUES  (1, 3.0),
        (2, 3.5),
        (3, 4.0),
        (4, 4.5),
        (5, 5.0);

INSERT INTO CONGNHAN (MaCN, Ho, Dem, Ten, NgaySinh, GioiTinh, HangCN, NgayTuyenDung, MaDoi)
VALUES  (118, 'Tran', 'Van', 'Hung', '2000-08-15', 'M', 1, '2023-11-01', 1),
        (138, 'Nguyen', NULL, 'Khanh', '1995-04-23', 'M', 3, '2021-03-01', 2);

INSERT INTO CONGTRINH (MaCT, TenCT, DiaDiem, DonviChinh)
VALUES  (11, 'Nha o Tran Thai Binh', 'Quan 3', 10),
        (12, 'Van phong HBC', 'Quan 7', 20);

INSERT INTO DOITHICONG (MaDoi, DoiTruong, ThuocDonVi)
VALUES  (1, NULL, 10),
        (2, NULL, 20);

INSERT INTO CHAMCONG (MaCT, MaDoi, MaCN, NgayLamViec, SoGio)
VALUES  (11, 1, 118, '2024-03-11', 8.0),
        (12, 2, 138, '2024-04-05', 8.0);
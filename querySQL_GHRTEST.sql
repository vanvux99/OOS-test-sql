-- CAU 1:
USE GHR_TEST;
GO

CREATE TABLE PHONGBAN 
(
	MAPB NVARCHAR(10) PRIMARY KEY,
	TENPB NVARCHAR(200) 
)
GO

CREATE TABLE CHUCVU
(
	MACV NVARCHAR(10) PRIMARY KEY,
	TENCV NVARCHAR(200)
)
GO

CREATE TABLE NHANVIEN
(
	MANV NVARCHAR(10) PRIMARY KEY,
	HOVATEN NVARCHAR(200),
	MAPB NVARCHAR(10),
	MACV NVARCHAR(10),
	NGAYSINH DATETIME,
	GIOITINH NVARCHAR(10),
	QUEQUAN NVARCHAR(200),
	NGAYLAMVIEC DATETIME
)
GO

CREATE TABLE HOPDONG
(
	MAHD NVARCHAR(10) PRIMARY KEY,
	MANV NVARCHAR(10),
	TENLOAIHOPDONG NVARCHAR(150),
	NGAYBATDAU DATETIME,
	NGAYKETTHUC DATETIME
)
GO

ALTER TABLE dbo.NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_PHONGBAN
    FOREIGN KEY (MAPB)
    REFERENCES dbo.PHONGBAN (MAPB);
GO

ALTER TABLE dbo.NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_CHUCVU
    FOREIGN KEY (MACV)
    REFERENCES dbo.CHUCVU (MACV);
GO

CREATE PROCEDURE ADD_DATA_PHONGBAN
(
    @MAPB NVARCHAR(10),
    @TENPB NVARCHAR(200)
)
AS
BEGIN
    INSERT INTO dbo.PHONGBAN
    (
        MAPB,
        TENPB
    )
    VALUES
    (   @MAPB, -- MAPB - nvarchar(10)
        @TENPB -- TENPB - nvarchar(200)
        );
END;
GO

CREATE PROCEDURE ADD_DATA_CHUCVU
    @MACV AS NVARCHAR(10),
    @TENCV AS NVARCHAR(200)
AS
BEGIN
    INSERT INTO dbo.CHUCVU
    (
        MACV,
        TENCV
    )
    VALUES
    (   @MACV, -- MACV - nvarchar(10)
        @TENCV -- TENCV - nvarchar(200)
        );
END;
GO

CREATE PROCEDURE ADD_DATA_NHANVIEN
(
    @MANV NVARCHAR(10),
    @HOVATEN NVARCHAR(200),
    @MAPB NVARCHAR(10),
    @MACV NVARCHAR(10),
    @NGAYSINH DATETIME,
    @GIOITINH NVARCHAR(10),
    @QUEQUAN NVARCHAR(200),
    @NGAYLAMVIEC DATETIME
)
AS
BEGIN
    INSERT INTO dbo.NHANVIEN
    (
        MANV,
        HOVATEN,
        MAPB,
        MACV,
        NGAYSINH,
        GIOITINH,
        QUEQUAN,
        NGAYLAMVIEC
    )
    VALUES
    (   @MANV,       -- MANV - nvarchar(10)
        @HOVATEN,    -- HOVATEN - nvarchar(200)
        @MAPB,       -- MAPB - nvarchar(10)
        @MACV,       -- MACV - nvarchar(10)
        @NGAYSINH,   -- NGAYSINH - datetime
        @GIOITINH,   -- GIOITINH - nvarchar(10)
        @QUEQUAN,    -- QUEQUAN - nvarchar(200)
        @NGAYLAMVIEC -- NGAYLAMVIEC - datetime
        );
END;
GO

CREATE PROCEDURE ADD_DATA_HOPDONG
(
    @MAHD NVARCHAR(10),
    @MANV NVARCHAR(10),
    @TENHOPDONG NVARCHAR(150),
    @NGAYBATDAU DATETIME,
    @NGAYKETTHUC DATETIME
)
AS
BEGIN
    INSERT INTO dbo.HOPDONG
    (
        MAHD,
        MANV,
        TENLOAIHOPDONG,
        NGAYBATDAU,
        NGAYKETTHUC
    )
    VALUES
    (   @MAHD,       -- MAHD - nvarchar(10)
        @MANV,       -- MANV - nvarchar(10)
        @TENHOPDONG, -- TENLOAIHOPDONG - nvarchar(150)
        @NGAYBATDAU, -- NGAYBATDAU - datetime
        @NGAYKETTHUC -- NGAYKETTHUC - datetime
        );
END;
GO

EXEC dbo.ADD_DATA_PHONGBAN @MAPB = N'OOS1', -- nvarchar(10)
                           @TENPB = N'OOS_Ban giám đốc' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_PHONGBAN @MAPB = N'OOS2', -- nvarchar(10)
                           @TENPB = N'TH_Phòng tổng hợp' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_PHONGBAN @MAPB = N'OOS3', -- nvarchar(10)
                           @TENPB = N'TKHAI_Phòng triển khai' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_PHONGBAN @MAPB = N'OOS4', -- nvarchar(10)
                           @TENPB = N'TVan_Phòng tư vấn' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_PHONGBAN @MAPB = N'OOS5', -- nvarchar(10)
                           @TENPB = N'HT_Phòng hỗ trợ' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_PHONGBAN @MAPB = N'OOS1', -- nvarchar(10)
                           @TENPB = N'OOS_Ban giám đốc' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_CHUCVU @MACV = N'CV1', -- nvarchar(10)
                         @TENCV = N'Giám đốc' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_CHUCVU @MACV = N'CV2', -- nvarchar(10)
                         @TENCV = N'Phó giám đốc' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_CHUCVU @MACV = N'CV3', -- nvarchar(10)
                         @TENCV = N'Trưởng phòng' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_CHUCVU @MACV = N'CV4', -- nvarchar(10)
                         @TENCV = N'Phó phòng' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_CHUCVU @MACV = N'CV5', -- nvarchar(10)
                         @TENCV = N'Nhân viên' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_CHUCVU @MACV = N'CV6', -- nvarchar(10)
                         @TENCV = N'Chuyên viên' -- nvarchar(200)
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'NV1',                         -- nvarchar(10)
                           @HOVATEN = N'Lê Văn A',                      -- nvarchar(200)
                           @MAPB = N'OOS1',                         -- nvarchar(10)
                           @MACV = N'CV1',                         -- nvarchar(10)
                           @NGAYSINH = '1982-01-01',   -- datetime
                           @GIOITINH = N'Nam',                     -- nvarchar(10)
                           @QUEQUAN = N'Hưng Yên',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2006-01-01' -- datetime
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'NV2',                         -- nvarchar(10)
                           @HOVATEN = N'Trần Văn B',                      -- nvarchar(200)
                           @MAPB = N'OOS1',                         -- nvarchar(10)
                           @MACV = N'CV1',                         -- nvarchar(10)
                           @NGAYSINH = '1982-10-10',   -- datetime
                           @GIOITINH = N'Nam',                     -- nvarchar(10)
                           @QUEQUAN = N'Nghệ An',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2017-10-01' -- datetime
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'NV3',                         -- nvarchar(10)
                           @HOVATEN = N'Trần Văn C',                      -- nvarchar(200)
                           @MAPB = N'OOS3',                         -- nvarchar(10)
                           @MACV = N'CV4',                         -- nvarchar(10)
                           @NGAYSINH = '1991-11-01',   -- datetime
                           @GIOITINH = N'Nam',                     -- nvarchar(10)
                           @QUEQUAN = N'Thái Bình',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2014-09-01' -- datetime
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'NV4',                         -- nvarchar(10)
                           @HOVATEN = N'Trần Văn D',                      -- nvarchar(200)
                           @MAPB = N'OOS3',                         -- nvarchar(10)
                           @MACV = N'CV4',                         -- nvarchar(10)
                           @NGAYSINH = '1988-07-01',   -- datetime
                           @GIOITINH = N'Nam',                     -- nvarchar(10)
                           @QUEQUAN = N'Thái Bình',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2012-07-01' -- datetime
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'NV5',                         -- nvarchar(10)
                           @HOVATEN = N'Trần Văn E',                      -- nvarchar(200)
                           @MAPB = N'OOS4',                         -- nvarchar(10)
                           @MACV = N'CV4',                         -- nvarchar(10)
                           @NGAYSINH = '1989-10-20',   -- datetime
                           @GIOITINH = N'Nam',                     -- nvarchar(10)
                           @QUEQUAN = N'Hải Dương',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2015-05-01' -- datetime
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'NV6',                         -- nvarchar(10)
                           @HOVATEN = N'Bùi Thị F',                      -- nvarchar(200)
                           @MAPB = N'OOS5',                         -- nvarchar(10)
                           @MACV = N'CV4',                         -- nvarchar(10)
                           @NGAYSINH = '1990-12-11',   -- datetime
                           @GIOITINH = N'Nữ',                     -- nvarchar(10)
                           @QUEQUAN = N'Ninh Bình',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2016-07-01' -- datetime
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'',                         -- nvarchar(10)
                           @HOVATEN = N'',                      -- nvarchar(200)
                           @MAPB = N'',                         -- nvarchar(10)
                           @MACV = N'',                         -- nvarchar(10)
                           @NGAYSINH = '2021-07-04 00:17:07',   -- datetime
                           @GIOITINH = N'',                     -- nvarchar(10)
                           @QUEQUAN = N'',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2021-07-04 00:17:07' -- datetime
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'NV7',                         -- nvarchar(10)
                           @HOVATEN = N'Phan Văn G',                      -- nvarchar(200)
                           @MAPB = N'OOS3',                         -- nvarchar(10)
                           @MACV = N'CV5',                         -- nvarchar(10)
                           @NGAYSINH = '1994-12-12',   -- datetime
                           @GIOITINH = N'Nam',                     -- nvarchar(10)
                           @QUEQUAN = N'Hà Nội',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2017-08-01' -- datetime
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'NV8',                         -- nvarchar(10)
                           @HOVATEN = N'Đồng Thị H',                      -- nvarchar(200)
                           @MAPB = N'OOS2',                         -- nvarchar(10)
                           @MACV = N'CV3',                         -- nvarchar(10)
                           @NGAYSINH = '1992-05-01',   -- datetime
                           @GIOITINH = N'Nữ',                     -- nvarchar(10)
                           @QUEQUAN = N'Nam Định',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2016-01-01' -- datetime
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'NV9',                         -- nvarchar(10)
                           @HOVATEN = N'Trinh Thị K',                      -- nvarchar(200)
                           @MAPB = N'OOS5',                         -- nvarchar(10)
                           @MACV = N'CV4',                         -- nvarchar(10)
                           @NGAYSINH = '1993-11-01',   -- datetime
                           @GIOITINH = N'Nữ',                     -- nvarchar(10)
                           @QUEQUAN = N'Ninh Bình',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2015-04-01' -- datetime
GO

EXEC dbo.ADD_DATA_NHANVIEN @MANV = N'NV10',                         -- nvarchar(10)
                           @HOVATEN = N'Trần Thị L',                      -- nvarchar(200)
                           @MAPB = N'OOS5',                         -- nvarchar(10)
                           @MACV = N'CV5',                         -- nvarchar(10)
                           @NGAYSINH = '1994-12-12',   -- datetime
                           @GIOITINH = N'Nữ',                     -- nvarchar(10)
                           @QUEQUAN = N'Hải Dương',                      -- nvarchar(200)
                           @NGAYLAMVIEC = '2017-08-01' -- datetime
GO

EXEC dbo.ADD_DATA_HOPDONG @MAHD = N'HD1',                         -- nvarchar(10)
                          @MANV = N'NV1',                         -- nvarchar(10)
                          @TENHOPDONG = N'Thử việc',                   -- nvarchar(150)
                          @NGAYBATDAU = '2014-09-0', -- datetime
                          @NGAYKETTHUC = '2014-11-30' -- datetime
GO

EXEC dbo.ADD_DATA_HOPDONG @MAHD = N'HD2',                         -- nvarchar(10)
                          @MANV = N'NV1',                         -- nvarchar(10)
                          @TENHOPDONG = N'Xác định thời hạn',                   -- nvarchar(150)
                          @NGAYBATDAU = '2014-12-01', -- datetime
                          @NGAYKETTHUC = '2015-11-30' -- datetime
GO 

EXEC dbo.ADD_DATA_HOPDONG @MAHD = N'HD3',                         -- nvarchar(10)
                          @MANV = N'NV1',                         -- nvarchar(10)
                          @TENHOPDONG = N'Không xác định thời hạn',                   -- nvarchar(150)
                          @NGAYBATDAU = '2015-12-01', -- datetime
                          @NGAYKETTHUC = NULL -- datetime
GO 

EXEC dbo.ADD_DATA_HOPDONG @MAHD = N'HD4',                         -- nvarchar(10)
                          @MANV = N'NV2',                         -- nvarchar(10)
                          @TENHOPDONG = N'Xác định thời hạn',                   -- nvarchar(150)
                          @NGAYBATDAU = '2014-12-016', -- datetime
                          @NGAYKETTHUC = '2015-11-30' -- datetime
GO 

EXEC dbo.ADD_DATA_HOPDONG @MAHD = N'HD5',                         -- nvarchar(10)
                          @MANV = N'NV2',                         -- nvarchar(10)
                          @TENHOPDONG = N'Xác định thời hạn',                   -- nvarchar(150)
                          @NGAYBATDAU = '2015-12-01', -- datetime
                          @NGAYKETTHUC = '2018-11-30' -- datetime
GO 

EXEC dbo.ADD_DATA_HOPDONG @MAHD = N'HD6',                         -- nvarchar(10)
                          @MANV = N'NV3',                         -- nvarchar(10)
                          @TENHOPDONG = N'Thử việc',                   -- nvarchar(150)
                          @NGAYBATDAU = '2015-12-01', -- datetime
                          @NGAYKETTHUC = '2016-01-31' -- datetime
GO 


-- CAU 2:
CREATE PROC THONGTIN_NHANVIEN 
AS
BEGIN
	SELECT MANV "Mã nhân viên", HOVATEN "Tên", TENPB "Phòng ban", TENCV "Công việc", NGAYSINH "Ngày sinh"
	FROM dbo.NHANVIEN
	INNER JOIN dbo.PHONGBAN ON NHANVIEN.MAPB = PHONGBAN.MAPB
	INNER JOIN dbo.CHUCVU ON CHUCVU.MACV = NHANVIEN.MACV
END
GO

CREATE PROC PHONGBAN_NHONHAT
AS
BEGIN
	SELECT NV.MAPB, NV.MANV, NV.HOVATEN
	FROM  dbo.NHANVIEN NV
	WHERE NV.MAPB = (SELECT MIN(MAPB) FROM dbo.PHONGBAN)
END
GO


-- CAU 3:
-- a,
CREATE PROC THONGTIN_PHONGBAN
AS
BEGIN
	SELECT  PB.MAPB "Mã phòng ban", PB.TENPB "Tên phòng ban", COUNT(PB.MAPB) AS "Số lượng nhân viên"
	FROM dbo.NHANVIEN NV, dbo.PHONGBAN PB
	WHERE NV.MAPB = PB.MAPB
	GROUP BY PB.MAPB, PB.TENPB
END
GO

-- b,
CREATE PROC CHUCVU_KHONGNHANVIEN
AS
BEGIN
    SELECT CV.MACV "Mã chức vụ",
           CV.TENCV "Tên chức vụ"
    FROM dbo.CHUCVU CV
        FULL JOIN dbo.NHANVIEN NV
            ON CV.MACV = NV.MACV
    WHERE NV.MACV = '';
END;
GO

-- CAU 4:
-- a,
CREATE PROC TIM_NHANVIEN
AS
BEGIN
    SELECT MANV "Mã nhân viên",
           HOVATEN "Họ và tên",
           NGAYSINH "Ngày sinh",
           QUEQUAN "Quê quán"
    FROM dbo.NHANVIEN
    WHERE QUEQUAN = N'Thái Bình'
          AND YEAR(NGAYSINH) > 1990;
END;
GO

-- b,
CREATE PROC NHANVIEN_TRUNGNGAYSINH
AS
BEGIN
    SELECT MANV "Mã nhân viên",
           HOVATEN "Họ và tên",
           COUNT(NGAYSINH) "Ngày sinh bị trùng"
    FROM dbo.NHANVIEN
    GROUP BY MANV,
             HOVATEN
    HAVING COUNT(NGAYSINH) > 1;
END;
GO


-- CAU 5:
ALTER PROC dbo.HOPDONG_MOINHAT
AS
BEGIN
	SELECT HD.MANV "Mã nhân viên", NV.HOVATEN "Họ tên", 
		HD.TENLOAIHOPDONG "Hợp đồng", HD.NGAYBATDAU "Ngày bắt đầu", HD.NGAYKETTHUC "Ngày kết thúc"
	FROM dbo.HOPDONG HD, dbo.NHANVIEN NV
	WHERE  HD.NGAYBATDAU = (SELECT MAX(NGAYBATDAU) FROM dbo.HOPDONG WHERE HD.MANV = NV.MANV)
END
GO


-- CAU 6: 
-- a,
ALTER PROC TIENTO_PHONGBAN
AS
BEGIN
	-- thay trực tiếp chuỗi bằng 1 chuỗi khác cắt từ vị trí '_'
	SELECT NV.MANV "Mã nhân viên", NV.HOVATEN "Tên nhân viên", 
		(REPLACE(PB.TENPB, PB.TENPB, SUBSTRING(PB.TENPB, CHARINDEX('_', PB.TENPB) + 1, LEN(PB.TENPB) - CHARINDEX('_',PB.TENPB) ))) AS "Tên phòng ban"
	FROM dbo.NHANVIEN NV, dbo.PHONGBAN PB
	WHERE NV.MAPB = PB.MAPB
END
GO

-- b,
CREATE PROC LIETKE_PHONGBAN
AS
BEGIN
	SELECT PB.MAPB "Mã phòng ban", 
		(SELECT COUNT(GIOITINH) FROM dbo.NHANVIEN WHERE GIOITINH = N'Nam') "Số lượng nam", 
		(SELECT COUNT(GIOITINH) FROM dbo.NHANVIEN WHERE GIOITINH = N'Nữ') "Số lượng nữ", 
		(SELECT COUNT(MACV) FROM dbo.NHANVIEN WHERE MACV = 'CV3') "Số lượng trưởng phòng",
		(SELECT COUNT(MANV) FROM dbo.NHANVIEN WHERE MAPB = PB.MAPB) "Số lượng nhân viên"
	FROM dbo.PHONGBAN PB
END
GO

-- CAU 7:
-- a,
ALTER PROC NHANVIEN_DILAM
	@THANG INT,
	@NAM INT
AS
BEGIN
	SELECT MANV "Mã nhân viên",
           HOVATEN "Tên nhân viên",
           MAPB "Mã phòng ban",
           MACV "Mã chức vụ",
           NGAYSINH "Ngày sinh",
           GIOITINH "Giới tính",
           QUEQUAN "Quê quán",
           NGAYLAMVIEC "Ngày làm việc"
	FROM dbo.NHANVIEN
	WHERE MONTH(NGAYLAMVIEC) = @THANG AND YEAR(NGAYLAMVIEC) = @NAM
END
GO

-- b,
ALTER PROC dbo.NHANVIEN_DILAM_2
    @THANG INT,
    @NAM INT
AS
BEGIN
    SELECT MANV "Mã nhân viên",
           HOVATEN "Tên nhân viên",
           MAPB "Mã phòng ban",
           MACV "Mã chức vụ",
           NGAYSINH "Ngày sinh",
           GIOITINH "Giới tính",
           QUEQUAN "Quê quán",
           NGAYLAMVIEC "Ngày làm việc"
    FROM dbo.NHANVIEN
    WHERE MONTH(NGAYLAMVIEC) <= @THANG
          AND YEAR(NGAYLAMVIEC) <= @NAM;
END;
GO


-- CAU 8:
ALTER PROC dbo.SINHNHAT
AS
BEGIN
    SELECT PB.MAPB "Mã phòng ban",
           (dbo.TIM_THU(PB.MAPB, 1)) AS "T1",
           (dbo.TIM_THU(PB.MAPB, 2)) AS "T2",
           (dbo.TIM_THU(PB.MAPB, 3)) AS "T3",
           (dbo.TIM_THU(PB.MAPB, 4)) AS "T4",
           (dbo.TIM_THU(PB.MAPB, 5)) AS "T5",
           (dbo.TIM_THU(PB.MAPB, 6)) AS "T6",
           (dbo.TIM_THU(PB.MAPB, 7)) AS "T7",
           (dbo.TIM_THU(PB.MAPB, 8)) AS "T8",
           (dbo.TIM_THU(PB.MAPB, 9)) AS "T9",
           (dbo.TIM_THU(PB.MAPB, 10)) AS "T10",
           (dbo.TIM_THU(PB.MAPB, 11)) AS "T11",
           (dbo.TIM_THU(PB.MAPB, 12)) AS "T12"
    FROM dbo.PHONGBAN PB;
END;
GO

ALTER FUNCTION TIM_THU
(
    @MAPB AS NVARCHAR(10),
    @THANG INT
)
RETURNS INT
AS
BEGIN
    RETURN
    (
        SELECT COUNT(NGAYSINH)
        FROM dbo.NHANVIEN
        WHERE MONTH(NGAYSINH) = @THANG
              AND MAPB = @MAPB
    );
END;
GO

-- CAU 9:
ALTER PROC dbo.HOPDONG_LIENTRUOC
AS
BEGIN
    SELECT NV.MANV "Mã nhân viên",
           NV.HOVATEN "Tên nhân viên",
           (
              dbo.HOP_DONG_MOI_NHAT_CUA_NHAN_VIEN(NV.MANV) 
           ) "Hợp đồng gần đây nhất",
           (
               dbo.THOIGIAN_HOPDONG_MOINHAT(NV.MANV)
           ) "Thời gian bắt đầu",
		   (dbo.LIEN_TRUOC_HOP_DONG_MOI_NHAT_2(NV.MANV)) "Hợp đồng trước đó",
           (dbo.LIEN_TRUOC_HOP_DONG_MOI_NHAT(NV.MANV)) "Thời gian bắt đầu"
    FROM dbo.NHANVIEN NV;
END;
GO


ALTER FUNCTION LIEN_TRUOC_HOP_DONG_MOI_NHAT
(
    @MANV NVARCHAR(10)
)
RETURNS DATETIME
AS
BEGIN
    RETURN
    (
        SELECT HD.NGAYBATDAU
        FROM
        (
            SELECT ROW_NUMBER() OVER (ORDER BY HD.NGAYBATDAU ASC) AS "START_DAY",
                   HD.NGAYBATDAU
            FROM dbo.HOPDONG HD
                INNER JOIN dbo.NHANVIEN NV
                    ON HD.MANV = NV.MANV
            WHERE NV.MANV = @MANV
        ) "HD"
        WHERE HD.START_DAY = 2
    );
END;
GO

ALTER FUNCTION LIEN_TRUOC_HOP_DONG_MOI_NHAT_2
(
    @MANV NVARCHAR(10)
)
RETURNS NVARCHAR(200)
AS
BEGIN
    RETURN
    (
        SELECT HD.TENLOAIHOPDONG
        FROM
        (
            SELECT ROW_NUMBER() OVER (ORDER BY HD.NGAYBATDAU ASC) AS "START_DAY",
                   HD.TENLOAIHOPDONG
            FROM dbo.HOPDONG HD
                INNER JOIN dbo.NHANVIEN NV
                    ON HD.MANV = NV.MANV
            WHERE NV.MANV = @MANV
        ) "HD"
        WHERE HD.START_DAY = 2
    );
END;
GO

ALTER FUNCTION HOP_DONG_MOI_NHAT_CUA_NHAN_VIEN
(
    @MANV NVARCHAR(10)
)
RETURNS NVARCHAR(200)
--WITH ENCRYPTION|SCHEMABINDING, ...
AS
BEGIN
    RETURN
    (
        SELECT HD.TENLOAIHOPDONG
        FROM dbo.HOPDONG HD
        WHERE HD.NGAYBATDAU =
        (
            SELECT MAX(NGAYBATDAU) FROM dbo.HOPDONG WHERE HD.MANV = @MANV
        )
    );
END;
GO

ALTER FUNCTION THOIGIAN_HOPDONG_MOINHAT
(
    @MANV AS NVARCHAR(10)
)
RETURNS DATETIME
AS
BEGIN
    RETURN
    (
        SELECT HD.NGAYBATDAU
        FROM dbo.HOPDONG HD
        WHERE HD.NGAYBATDAU =
        (
            SELECT MAX(NGAYBATDAU) FROM dbo.HOPDONG WHERE HD.MANV = @MANV
        )
    );
END;
GO


-- CAU 10:
ALTER PROC INSERT_DATA_TABLE_TBL
(
    @THANG INT,
    @NAM INT
)
AS
BEGIN
    DECLARE @TBL TABLE
    (
        NGAY DATETIME,
        THU INT
    );
    DECLARE @SINHNHAT TABLE
    (
        NGAY DATETIME,
        NHANVIEN NVARCHAR(200)
    );
    DECLARE @SONGAY INT = 0,
            @INDEX INT = 1;

    -- lọc theo tháng để tìm số ngày
    IF @THANG = 2
        SET @SONGAY = 28;
    IF @NAM % 400 = 0
       AND @THANG = 2
        SET @SONGAY = 29;
    IF @THANG = 1
       OR @THANG = 3
       OR @THANG = 5
       OR @THANG = 7
       OR @THANG = 8
       OR @THANG = 10
       OR @THANG = 12
        SET @SONGAY = 31;
    IF @THANG = 4
       OR @THANG = 6
       OR @THANG = 9
       OR @THANG = 11
        SET @SONGAY = 30;

    -- insert data vào bảng theo số ngày của tháng
    WHILE @INDEX <= @SONGAY
    BEGIN
        INSERT INTO @TBL
        (
            NGAY,
            THU
        )
        VALUES
        (   CONCAT_WS('-', @NAM, @THANG, @INDEX),                 -- NGAY - datetime
            dbo.TIM_THU_THEO_NGAY_THANG_NAM(@INDEX, @THANG, @NAM) -- THU - int
            );
        SET @INDEX = @INDEX + 1;
    END;

    -- duyệt bảng
    BEGIN
        SELECT TOP (100)
               NGAY "Năm tháng ngày",
               THU "Thứ trong tuần"
        FROM @TBL;
    END;

    -- tìm sinh nhật của nhân viên trong tháng
    BEGIN
        SELECT MANV "Mã nhân viên",
               HOVATEN "Tên nhân viên",
               MAPB "Mã phòng ban",
               MACV "Mã chức vụ",
               NGAYSINH "Ngày sinh",
               GIOITINH "Giới tính",
               QUEQUAN "Quê quán",
               NGAYLAMVIEC "Ngày làm việc"
        FROM dbo.NHANVIEN
        WHERE MONTH(NGAYSINH) = @THANG
              AND YEAR(NGAYSINH) = @NAM;
    END;
END;
GO


CREATE FUNCTION dbo.TIM_THU_THEO_NGAY_THANG_NAM
(
    @DAY INT,
    @MONTH INT,
    @YEAR INT
)
RETURNS INT
AS
BEGIN
    DECLARE @JMM INT = 0,
            @JMY INT = 0,
            @JMD INT = 0,
            @RESULT INT = 0;

    SET @JMM = ((14 - @MONTH) / 12);
    SET @JMY = (@YEAR + 4800 - @JMM);
    SET @JMD
        = @DAY - 32045 + (((@MONTH + 12 * @JMM - 3) * 153 + 2) / 5) + (@JMY * 365) + (@JMY / 4) - (@JMY / 100)
          + (@JMY / 400);
    SET @RESULT = @JMD % 7;

    RETURN @RESULT + 2;
END;
GO

--EXEC dbo.INSERT_DATA_TABLE_TBL 7, 2021








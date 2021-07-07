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
CREATE PROC proc_ThongTinHopDongNhanVien
AS BEGIN
    SELECT HD.MANV "Mã nhân viên", NV.HOVATEN "Họ tên", HD.TENLOAIHOPDONG "Hợp đồng", HD.NGAYBATDAU "Ngày bắt đầu", HD.NGAYKETTHUC "Ngày kết thúc"
    FROM dbo.HOPDONG HD
         FULL JOIN dbo.NHANVIEN NV ON NV.MANV=HD.MANV
    WHERE HD.NGAYBATDAU=(SELECT MAX(NGAYBATDAU)FROM dbo.HOPDONG WHERE dbo.HOPDONG.MANV=NV.MANV)AND NV.MANV=NV.MANV;
END;
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
    IF @THANG <= MONTH(GETDATE())
       AND @NAM <= YEAR(GETDATE())
    BEGIN
		DECLARE @DATE_GOTO_WORK VARCHAR(200) = dbo.CONVERT_DATETIME(CONCAT_WS('-', @NAM, @THANG, dbo.TIM_SONGAY( @THANG, @NAM)))

        SELECT MANV "Mã nhân viên",
               HOVATEN "Tên nhân viên",
               MAPB "Mã phòng ban",
               MACV "Mã chức vụ",
               NGAYSINH "Ngày sinh",
               GIOITINH "Giới tính",
               QUEQUAN "Quê quán",
               NGAYLAMVIEC "Ngày làm việc"
        FROM dbo.NHANVIEN
		-- đưa về dạng Unixtime và so sánh.
        WHERE dbo.CONVERT_DATETIME(NGAYLAMVIEC) > @DATE_GOTO_WORK
    END;
    ELSE
        SELECT N'Thời gian nhập vào không được vượt qua thời gian hiện tại';
END;
GO


-- CAU 8:
ALTER PROC dbo.SINHNHAT
AS
BEGIN
    SELECT * FROM(SELECT PB.MAPB, MONTH(NV.NGAYSINH) THANG, NV.MANV
		FROM dbo.NHANVIEN NV INNER JOIN dbo.PHONGBAN PB ON PB.MAPB = NV.MAPB) NVPB
		PIVOT (Count(MANV) FOR THANG IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) PVT
END;
GO

CREATE FUNCTION Function_SinhNhatNhanVien()
RETURNS NVARCHAR(MAX)
AS BEGIN
    DECLARE @month NVARCHAR(MAX), @query NVARCHAR(MAX);
    SELECT @month=STUFF((SELECT ','+QUOTENAME(snnv.NGAYSINH) t1
                         FROM(SELECT DISTINCT MONTH(NGAYSINH) NGAYSINH FROM dbo.NHANVIEN) snnv
                         GROUP BY snnv.NGAYSINH
                         ORDER BY snnv.NGAYSINH
                        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '');
    SET @query=N'
		select * from (
			SELECT * FROM(SELECT PB.MAPB, MONTH(NV.NGAYSINH) THANG, NV.MANV
			FROM dbo.NHANVIEN NV INNER JOIN dbo.PHONGBAN PB ON PB.MAPB = NV.MAPB) NVPB
		) ad
		pivot (
			count(MANV) for THANG in ('+@month+N')
		) p ';
    RETURN (@query);
END;
GO

        
-- CAU 9:
ALTER PROC dbo.HOPDONG_LIENTRUOC
AS BEGIN
    SELECT NV.MANV "Mã nhân viên", 
		NV.HOVATEN "Tên nhân viên", 
		(dbo.FUNCTION_GET_TENHOPDONG2(NV.MANV, 1)) "Hợp đồng mới nhất", 
		(SELECT tb.NGAYBATDAU FROM dbo.FUN_THONGTIN_HOPDONG_NHANVIEN() tb WHERE tb.MANV=nv.MANV) "Thời gian bắt đầu", 
		(dbo.FUNCTION_GET_TENHOPDONG2(NV.MANV, 2)) "Hợp đồng gần đây", 
		(dbo.FUNCTION_GET_THOIGIAN_HOPDONG_LIENTRUOC(NV.MANV)) "Thời gian bắt đầu"
    FROM dbo.NHANVIEN NV
END;
GO

/**
	Lấy ra thời gian của hợp đồng liền trước hợp đồng mới nhất theo mã nhân viên
*/
CREATE FUNCTION FUNCTION_GET_THOIGIAN_HOPDONG_LIENTRUOC(@MANV NVARCHAR(10))
RETURNS DATETIME
AS BEGIN
    RETURN (SELECT MAX(TTHD.NGAYBATDAU)
            FROM(SELECT NV.MANV, HD.MAHD, HD.TENLOAIHOPDONG, HD.NGAYBATDAU, HD.NGAYKETTHUC
                 FROM dbo.NHANVIEN NV, dbo.HOPDONG HD
                 WHERE NV.MANV=HD.MANV AND HD.MANV=@MANV AND HD.NGAYBATDAU<(SELECT dbo.FUNTION_GET_THOIGIAN_HOPDONG_MOINHAT(@MANV))) AS TTHD );
END;
GO

-- cau 5 function:
ALTER FUNCTION dbo.FUN_THONGTIN_HOPDONG_NHANVIEN()
RETURNS TABLE
AS
RETURN SELECT HD.MANV, NV.HOVATEN, HD.TENLOAIHOPDONG, HD.NGAYBATDAU, HD.NGAYKETTHUC
       FROM dbo.HOPDONG HD
            FULL JOIN dbo.NHANVIEN NV ON NV.MANV=HD.MANV
       WHERE HD.NGAYBATDAU=(SELECT MAX(NGAYBATDAU)FROM dbo.HOPDONG WHERE dbo.HOPDONG.MANV=NV.MANV)AND NV.MANV=NV.MANV;
GO

/**
	Lấy ra tên của hợp đồng theo mã nhân viên
	id = 1: mới nhất, id = 2: liền trước mới nhất
*/
ALTER FUNCTION dbo.FUNCTION_GET_TENHOPDONG2(@MANV NVARCHAR(10), @ID INT)
RETURNS NVARCHAR(200)
AS BEGIN
    DECLARE @RESULT NVARCHAR(MAX);
    IF @ID=1 BEGIN
        SET @RESULT=(SELECT tb.TENLOAIHOPDONG
                     FROM dbo.FUN_THONGTIN_HOPDONG_NHANVIEN() tb
                     WHERE tb.MANV=@MANV);
    END;
    IF @ID=2 BEGIN
        SET @RESULT=(SELECT TENLOAIHOPDONG
                     FROM dbo.HOPDONG
                     WHERE MANV=@MANV AND NGAYBATDAU=(SELECT dbo.FUNCTION_GET_THOIGIAN_HOPDONG_LIENTRUOC(@MANV)));
    END;
    RETURN @RESULT;
END;
GO


-- CAU 10:
ALTER PROC dbo.INSERT_DATA_TABLE_TBL(@THANG INT, @NAM INT)
AS BEGIN
    DECLARE @TBL TABLE(NGAY DATE, THU INT);
    DECLARE @SINHNHAT TABLE(NGAY DATETIME, NHANVIEN NVARCHAR(200));
    DECLARE @SONGAY INT=0, @INDEX INT=1;

    -- insert data vào bảng theo số ngày của tháng
    WHILE @INDEX<=DATEPART(DAY, DATEADD(DAY, -1, CONCAT_WS('-', @NAM, @THANG + 1, 1)))BEGIN
        INSERT INTO @TBL(NGAY, THU)
        VALUES(CONCAT_WS('-', @NAM, @THANG, @INDEX), -- NGAY - date
        DATEPART(WEEKDAY, CONCAT_WS('-', @NAM, @THANG, @INDEX)) -- THU - int
            );
        SET @INDEX=@INDEX+1;
    END;

    -- duyệt bảng
    BEGIN
        SELECT TOP(100)NGAY "Năm tháng ngày", THU "Thứ trong tuần" FROM @TBL;
    END;

    -- tìm sinh nhật của nhân viên trong tháng
    BEGIN
        SELECT MANV "Mã nhân viên", HOVATEN "Tên nhân viên", MAPB "Mã phòng ban", MACV "Mã chức vụ", NGAYSINH "Ngày sinh", GIOITINH "Giới tính", QUEQUAN "Quê quán", NGAYLAMVIEC "Ngày làm việc"
        FROM dbo.NHANVIEN
        WHERE MONTH(NGAYSINH)=@THANG;
    END;
END;
GO

EXEC dbo.INSERT_DATA_TABLE_TBL @THANG=7, -- int
    @NAM=2021 -- int


CREATE FUNCTION TIM_SONGAY
(
    @THANG INT,
    @NAM INT
)
RETURNS INT
AS
BEGIN
    DECLARE @SONGAY INT = 0;

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

    RETURN @SONGAY;
END;
GO

ALTER FUNCTION CONVERT_DATETIME
(
    @DATE AS DATETIME
)
RETURNS VARCHAR(200)
AS
BEGIN
    RETURN
    (
        SELECT DATEDIFF(s, @DATE, GETDATE())
    );
END; 
GO








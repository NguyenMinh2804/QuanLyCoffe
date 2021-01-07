USE [master]
GO
/****** Object:  Database [quanLyCafe]    Script Date: 07/01/2021 8:54:12 CH ******/
CREATE DATABASE [quanLyCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanLyCafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NGUYENMINH\MSSQL\DATA\quanLyCafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quanLyCafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NGUYENMINH\MSSQL\DATA\quanLyCafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [quanLyCafe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanLyCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanLyCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanLyCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanLyCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanLyCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanLyCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanLyCafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quanLyCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanLyCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quanLyCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanLyCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanLyCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanLyCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanLyCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanLyCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanLyCafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [quanLyCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanLyCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanLyCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanLyCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanLyCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanLyCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanLyCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanLyCafe] SET RECOVERY FULL 
GO
ALTER DATABASE [quanLyCafe] SET  MULTI_USER 
GO
ALTER DATABASE [quanLyCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quanLyCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanLyCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanLyCafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quanLyCafe] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'quanLyCafe', N'ON'
GO
ALTER DATABASE [quanLyCafe] SET QUERY_STORE = OFF
GO
USE [quanLyCafe]
GO
/****** Object:  UserDefinedFunction [dbo].[fChuyenCoDauThanhKhongDau]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fChuyenCoDauThanhKhongDau](@inputVar NVARCHAR(MAX) )
RETURNS NVARCHAR(MAX)
AS
BEGIN    
    IF (@inputVar IS NULL OR @inputVar = '')  RETURN ''
   
    DECLARE @RT NVARCHAR(MAX)
    DECLARE @SIGN_CHARS NCHAR(256)
    DECLARE @UNSIGN_CHARS NCHAR (256)
 
    SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' + NCHAR(272) + NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyyAADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'
 
    DECLARE @COUNTER int
    DECLARE @COUNTER1 int
   
    SET @COUNTER = 1
    WHILE (@COUNTER <= LEN(@inputVar))
    BEGIN  
        SET @COUNTER1 = 1
        WHILE (@COUNTER1 <= LEN(@SIGN_CHARS) + 1)
        BEGIN
            IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@inputVar,@COUNTER ,1))
            BEGIN          
                IF @COUNTER = 1
                    SET @inputVar = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@inputVar, @COUNTER+1,LEN(@inputVar)-1)      
                ELSE
                    SET @inputVar = SUBSTRING(@inputVar, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@inputVar, @COUNTER+1,LEN(@inputVar)- @COUNTER)
                BREAK
            END
            SET @COUNTER1 = @COUNTER1 +1
        END
        SET @COUNTER = @COUNTER +1
    END
    -- SET @inputVar = replace(@inputVar,' ','-')
    RETURN @inputVar
END
GO
/****** Object:  Table [dbo].[loai_mon]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai_mon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_loaiMon] [char](8) NULL,
	[ten_loaiMon] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mon]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_mon] [char](8) NULL,
	[ten_mon] [nvarchar](256) NULL,
	[ma_loaiMon] [char](8) NULL,
	[gia] [numeric](16, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vmon]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vmon] as select a.*, b.ten_loaiMon from mon a left join loai_mon b on a.ma_loaiMon = b.ma_loaiMon 
GO
/****** Object:  Table [dbo].[Account]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[tai_khoan] [char](16) NOT NULL,
	[password] [char](32) NULL,
	[loai_tk] [char](1) NULL,
	[displayname] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[tai_khoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ban]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ban](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_ban] [char](8) NULL,
	[ten_ban] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chi_tiet_hoa_don]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_hoa_don](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_cthd] [int] NULL,
	[ma_hoadon] [char](50) NULL,
	[ma_mon] [char](8) NULL,
	[so_luong] [int] NULL,
	[don_gia] [numeric](16, 2) NULL,
	[thanh_tien] [numeric](16, 2) NULL,
	[ngay_hd] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dvt]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_dvt] [nvarchar](32) NULL,
	[ten_dvt] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_hoadon] [char](50) NULL,
	[ma_kh] [char](8) NULL,
	[thanh_tien] [numeric](16, 2) NULL,
	[giam_gia] [numeric](16, 2) NULL,
	[thanh_toan] [numeric](16, 2) NULL,
	[ngay_hd] [datetime] NULL,
	[status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_kh] [char](8) NULL,
	[ten_kh] [nvarchar](256) NULL,
	[dia_chi] [nvarchar](512) NULL,
	[sdt] [char](16) NULL,
	[email] [char](128) NULL,
	[ma_loaikh] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai_nv]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai_nv](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_loainv] [char](8) NULL,
	[ten_loainv] [nvarchar](256) NULL,
	[luong] [numeric](16, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nha_cc]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nha_cc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_kh] [char](8) NULL,
	[ten_kh] [nvarchar](256) NULL,
	[dia_chi] [nvarchar](512) NULL,
	[sdt] [char](16) NULL,
	[email] [char](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhan_vien]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhan_vien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_nv] [char](8) NULL,
	[ten_nv] [nvarchar](256) NULL,
	[dia_chi] [nvarchar](512) NULL,
	[sdt] [char](16) NULL,
	[email] [char](128) NULL,
	[ma_loainv] [char](8) NULL,
	[he_so] [float] NULL,
	[so_cmnd] [char](16) NULL,
	[status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phan_quyen]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phan_quyen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tai_khoan] [char](16) NULL,
	[id1] [bit] NULL,
	[id2] [bit] NULL,
	[id3] [bit] NULL,
	[id4] [bit] NULL,
	[id5] [bit] NULL,
	[id6] [bit] NULL,
	[id7] [bit] NULL,
	[id8] [bit] NULL,
	[id9] [bit] NULL,
	[id10] [bit] NULL,
	[id11] [bit] NULL,
	[id12] [bit] NULL,
	[id13] [bit] NULL,
	[id14] [bit] NULL,
	[id15] [bit] NULL,
	[id16] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phieu_nhap_kho]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phieu_nhap_kho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_vt] [char](8) NULL,
	[so_luong] [float] NULL,
	[ngay_nhap] [datetime] NULL,
	[don_gia] [numeric](16, 0) NULL,
	[thanh_tien] [numeric](16, 0) NULL,
	[ma_ncc] [char](8) NULL,
	[ma_dvt] [nvarchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phieu_xuat_kho]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phieu_xuat_kho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_vt] [char](8) NULL,
	[so_luong] [float] NULL,
	[ngay_nhap] [smalldatetime] NULL,
	[dvt] [nvarchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qui_doivt]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qui_doivt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_dvt] [nvarchar](16) NULL,
	[ma_dvt2] [nvarchar](16) NULL,
	[sl] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vat_tu]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vat_tu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_vt] [char](8) NULL,
	[ten_vt] [nvarchar](256) NULL,
	[ma_dvt] [nvarchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[bao_cao_ct_hd]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[bao_cao_ct_hd]
@ngay_tu char(30),
@ngay_den char(30)
as
begin
declare @tong numeric(16,2), @giam_gia numeric(16,2), @thanh_toan numeric(16,2)

select 0 as sysoder,a.*, b.ten_mon into #temp1 from chi_tiet_hoa_don a left join mon b on a.ma_mon = b.ma_mon where CONVERT(char(10),ngay_hd,103) >= CONVERT(char(10),@ngay_tu,103) and CONVERT(char(10),ngay_hd,103) <=CONVERT(char(10),@ngay_den,103) order by ngay_hd
--select @giam_gia = SUM(giam_gia) from #temp1
--select @thanh_toan = SUM(thanh_toan) from #temp1
--insert into #temp1 (sysoder,ma_hoadon,ngay_hd, thanh_tien,giam_gia,thanh_toan) values (-2,'TOTAL',null,@tong,@giam_gia,@thanh_toan) 
--insert into #temp1 (sysoder,ma_hoadon,ngay_hd,thanh_tien,giam_gia,thanh_toan) values (-1,'',null,null,null,null) 
select ma_cthd as STT, rtrim(ma_hoadon) as N'Mã hóa đơn', CONVERT(char(10),ngay_hd,103) as 'Ngày hóa đơn',ma_mon as N'Mã món',ten_mon as N'Tên món', Format(so_luong, '#,##0') as N'Số lượng', Format(don_gia, '#,##0') as N'Đơn giá', Format(thanh_tien, '#,##0') as N'Thành tiền' from #temp1  order by ngay_hd
end
GO
/****** Object:  StoredProcedure [dbo].[bao_cao_hd]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[bao_cao_hd]
@ngay_tu char(30),
@ngay_den char(30)
as
begin
declare @tong numeric(16,2), @giam_gia numeric(16,2), @thanh_toan numeric(16,2)
select 0 as sysoder,ROW_NUMBER() over(order by ngay_hd) as STT ,* into #temp1 from hoa_don where CONVERT(char(10),ngay_hd,103) >= CONVERT(char(10),@ngay_tu,103) and CONVERT(char(10),ngay_hd,103) <=CONVERT(char(10),@ngay_den,103)
select @tong = SUM(thanh_tien) from #temp1
select @giam_gia = SUM(giam_gia) from #temp1
select @thanh_toan = SUM(thanh_toan) from #temp1
insert into #temp1 (sysoder,ma_hoadon,ngay_hd, thanh_tien,giam_gia,thanh_toan) values (-2,'TOTAL',null,@tong,@giam_gia,@thanh_toan) 
insert into #temp1 (sysoder,ma_hoadon,ngay_hd,thanh_tien,giam_gia,thanh_toan) values (-1,'',null,null,null,null) 
select STT,rtrim(ma_hoadon) as N'Mã hóa đơn', CONVERT(char(10),ngay_hd,103) as 'Ngày hóa đơn',  Format(thanh_tien, '#,##0') as N'Tổng cộng', Format(giam_gia, '#,##0') as N'Giảm giá', Format(thanh_toan, '#,##0') as N'Thanh toán' from #temp1  order by ngay_hd
end
GO
/****** Object:  StoredProcedure [dbo].[bao_cao_nhap_kho]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[bao_cao_nhap_kho]
@ma_vt char(8),
@ngay_tu nvarchar(30)
as
begin
Declare @q nvarchar(4000), @key  nvarchar(300)
select top 0 ngay_nhap,ma_ncc,ma_vt,ma_dvt,so_luong,don_gia,thanh_tien into #temp1 from phieu_nhap_kho
set @key = 'and 1=1'
if (@ma_vt <> '') set @key = @key +'and ma_vt =rtrim('''+ @ma_vt+''') '
print @key
SET @q = 'insert into #temp1 select ngay_nhap,ma_ncc,ma_vt,ma_dvt,so_luong,don_gia,thanh_tien From phieu_nhap_kho where CONVERT(char(10),ngay_nhap,103) <= Rtrim(CONVERT(char(10),'''+@ngay_tu+''',103)) '+@key+' order by ngay_nhap, ma_vt'
print @q
EXECUTE(@q)
Select Max(CONVERT(char(10),ngay_nhap,103)) as N'Ngày nhập', a.ma_vt as N'Mã vật tư', max(b.ten_vt) as N'Tên vật tư', max(a.ma_ncc) as N'Mã nhà cung cấp', max(c.ten_kh) as N'Tên nhà cung cấp', max(a.ma_dvt) as 'Đơn vị tính', Format(sum(so_luong), '#,##0') as N'Số lượng',max(d.ma_dvt2) as 'Đơn vị tính qui đổi',Format(sum(so_luong*d.sl), '#,##0') as 'Số lượng qui đổi' ,Format(sum(don_gia), '#,##0') as N'Đơn giá', Format(sum(thanh_tien), '#,##0') as 'Thành tiền' from #temp1 a left join vat_tu b on a.ma_vt = b.ma_vt left join nha_cc c on a.ma_ncc = c.ma_kh left join qui_doivt d on a.ma_dvt = d.ma_dvt group by a.ma_vt
end
GO
/****** Object:  StoredProcedure [dbo].[bao_cao_ton_kho]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bao_cao_ton_kho]
@ma_vt char(8),
@ngay_tu nvarchar(30)
as
begin
Declare @q nvarchar(4000), @key  nvarchar(300)

select top 0 ngay_nhap,ma_ncc,ma_vt,ma_dvt,so_luong,don_gia,thanh_tien into #temp1 from phieu_nhap_kho
select top 0 id,ngay_nhap,ma_vt,dvt,so_luong into #temp2 from phieu_xuat_kho
set @key = 'and 1=1'
if (@ma_vt <> '') set @key = @key +'and ma_vt =rtrim('''+ @ma_vt+''') '
SET @q = 'insert into #temp1 select ngay_nhap,ma_ncc,ma_vt,ma_dvt,so_luong,don_gia,thanh_tien From phieu_nhap_kho where CONVERT(char(10),ngay_nhap,103) <= Rtrim(CONVERT(char(10),'''+@ngay_tu+''',103)) '+@key+' order by ngay_nhap, ma_vt'
print @q
EXECUTE(@q)
SET @q = 'insert into #temp2 select ngay_nhap,ma_vt,dvt,so_luong From phieu_xuat_kho where CONVERT(char(10),ngay_nhap,103) <= Rtrim(CONVERT(char(10),'''+@ngay_tu+''',103)) '+@key+' order by ngay_nhap, ma_vt'
print @q
EXECUTE(@q)
select max(ngay_nhap) as ngay ,max(ma_ncc) as ma_ncc, ma_vt, max(a.ma_dvt) as ma_dvt, sum(so_luong) as so_luong, max(b.ma_dvt2) as dvt2, sum(a.so_luong*b.sl) as sl2, SUM(don_gia) as don_gia, sum(thanh_tien) as thanh_tien into #temp3 from #temp1 a left join qui_doivt b on a.ma_dvt = b.ma_dvt group by ma_vt
select MAX(ngay_nhap) as ngay, ma_vt, MAX(dvt) as ma_dvt, SUM(so_luong) as so_luong,max(b.ma_dvt2) as dvt2, sum(a.so_luong*b.sl) as sl2  into #temp4 from #temp2 a left join qui_doivt b on a.dvt = b.ma_dvt group by ma_vt
select a.ma_vt as N'Mã vật tư',c.ten_vt as N'Tên vật tư', a.ma_dvt as N'Đơn vị tính',Format(case when (b.so_luong <> '') then (a.so_luong - b.so_luong) else a.so_luong end, '#,##0') as N'Số lượng',a.dvt2 as 'Đơn vị tính qui đổi',Format(case when (b.sl2 <> '') then(a.sl2 - b.sl2) else a.sl2 end , '#,##0')as N'Số lượng qui đổi'  from #temp3 a left join #temp4 b on a.ma_vt = b.ma_vt left join vat_tu c on a.ma_vt = c.ma_vt

SET IDENTITY_INSERT #temp2 ON

end
GO
/****** Object:  StoredProcedure [dbo].[bao_cao_xuat_kho]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[bao_cao_xuat_kho]
@ma_vt char(8),
@ngay_tu nvarchar(30)
as
begin
Declare @q nvarchar(4000), @key  nvarchar(300)
select top 0 ngay_nhap,ma_vt,dvt,so_luong into #temp1 from phieu_xuat_kho
set @key = 'and 1=1'
if (@ma_vt <> '') set @key = @key +'and ma_vt =rtrim('''+ @ma_vt+''') '
print @key
SET @q = 'insert into #temp1 select ngay_nhap,ma_vt,dvt,so_luong From phieu_xuat_kho where CONVERT(char(10),ngay_nhap,103) <= Rtrim(CONVERT(char(10),'''+@ngay_tu+''',103)) '+@key+' order by ngay_nhap, ma_vt'
print @q
EXECUTE(@q)
Select Max(CONVERT(char(10),ngay_nhap,103)) as N'Ngày nhập', a.ma_vt as N'Mã vật tư', max(b.ten_vt) as N'Tên vật tư',  max(a.dvt) as 'Đơn vị tính', Format(sum(so_luong), '#,##0') as N'Số lượng',max(d.ma_dvt2) as 'Đơn vị tính qui đổi',Format(sum(so_luong*d.sl), '#,##0') as 'Số lượng qui đổi'  from #temp1 a left join vat_tu b on a.ma_vt = b.ma_vt left join qui_doivt d on a.dvt = d.ma_dvt group by a.ma_vt
end
GO
/****** Object:  StoredProcedure [dbo].[column_chart]    Script Date: 07/01/2021 8:54:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[column_chart]
@nam int
as
begin
select MONTH(ngay_hd) as thang, thanh_toan into #temp1 from hoa_don where YEAR(ngay_hd) = @nam
select thang, SUM(thanh_toan) as thanh_toan into #temp3 from #temp1 group by thang order by thang
create table #temp2
(
	thang int,
	thanh_toan int
)
insert into #temp2 values(1,0)
insert into #temp2 values(2,0)
insert into #temp2 values(3,0)
insert into #temp2 values(4,0)
insert into #temp2 values(5,0)
insert into #temp2 values(6,0)
insert into #temp2 values(7,0)
insert into #temp2 values(8,0)
insert into #temp2 values(9,0)
insert into #temp2 values(10,0)
insert into #temp2 values(11,0)
insert into #temp2 values(12,0)
update #temp2 set thanh_toan = a.thanh_toan from #temp3 a left join #temp2 b on a.thang = b.thang
select * from #temp2
end
GO
USE [master]
GO
ALTER DATABASE [quanLyCafe] SET  READ_WRITE 
GO

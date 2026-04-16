-- MSSV: 24280029
-- Họ tên: Nguyễn Minh Trung
-- DBMS: My SQL 

-- Câu 1: Viết các lệnh SQL định nghĩa dữ liệu để tạo cơ sở dữ liệu có tên là csdl_khachhang ứng với lược đồ đã cho trong tập tin Khách hàng - Lược đồ.pdf.
create schema csdl_khachhang;

use csdl_khachhang;

create table sieuthi(
	mast		int				not null,
	tenst	varchar(50)		not null,
	diadiem	varchar(100)		not null,
	constraint PK_sieuthi
		primary key (mast),
	constraint AK_sieuthi_tenst
		unique (tenst)
);

create table thanhvien(
	matv			int			not null,
	madinhdanh	char(12)		not null,
	hoten		varchar(50)	not null,
	ngaysinh		date 		not null,
	gioitinh		char			not null
				check(gioitinh in ('0','1')),
	diachi		varchar(100)	not null,
	sodt			char(10)		not null,
	constraint PK_thanhvien
		primary key (matv),
	constraint AK_thanhvien_sodt
		unique (sodt)
);

create table thetv(
	mathe		int 			not null,
	mast			int			not null,
	hangtv		int			not null
				check(hangtv in (0,1,2,3)),
	ngaycap		date 		not null,
	ngayhethan	date			not null,
	constraint PK_thetv
		primary key (mathe)
);

create table diemtv(
	mathe		int			not null,
	kydiem		int			not null,
	diemtichluy	int			not null default 0,
	constraint PK_diemtv
		primary key (mathe, kydiem)
);

alter table	thetv
	add constraint FK_thetv_sieuthi
		foreign key (mast) references sieuthi(mast);

alter table	thetv
	add constraint FK_thetv_thanhvien
		foreign key (matv) references thanhvien(matv);

alter table	diemtv
	add constraint FK_diemtv_thetv
		foreign key (mathe) references thetv(mathe);

-- Câu 2: Viết lệnh SQL để cập nhật trạng thái ban đầu cho cơ sở dữ liệu với dữ liệu đã cho trong tập tin Khách hàng - Dữ liệu.xlsx

insert into sieuthi
values	(1,'COOP Ly Thuong Kiet','497 Hoa Hao, P. 7, Q. 10, Tp. Ho Chi Minh'),
		(2,'COOP Cong Quynh','189C Cong Quynh, P. Nguyen Cu Trinh, Q. 1, Tp. Ho Chi Minh'),
		(3,'COOP Phu My Hung','KDC My Phuoc Nguyen Van Linh, P. Tan Phong, Q. 7, Tp. Ho Chi Minh');

insert into thanhvien
values	(1,'052888665555','Nguyen Thi Ngoc','1972-11-10','0','127 Nguyen Van Cu, P. 4, Q. 5, Tp. Ho Chi Minh','0902493592'),
		(2,'0123456789','Nguyen Van Hung','1982-5-15','1','159 Tran Hung Đao, Q. 5, Tp. Ho Chi Minh','0903666545');

insert into thetv
values	(1,1,1,0,'2011-4-19','2014-4-19'),
		(2,2,2,2,'2012-7-25','2015-7-25');

insert into diemtv
values	(1,2013,38),
		(2,2013,36);

-- Câu 3: Lệnh SQL:
 -- Cập nhật lại ngày cấp thẻ thành viên là ngày hiện tại và ngày hết hạn là sau 3 năm kể từ ngày cấp cho tất cả các thẻ thành viên.
update thetv
	set ngaycap = current_date, -- có gạch chân current_date
		ngayhethan = current_date + + interval 3 year;

-- 3.2 - Xóa điểm tích lũy của tất cả thẻ thành viên trong kỳ điểm 2013.
update diemtv
	set diemtichluy = null
	where  kydiem = 2013;

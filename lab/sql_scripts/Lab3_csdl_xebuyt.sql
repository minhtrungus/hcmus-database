USE csdl_xebuyt;
/*Các câu lệnh truy vấn select theo yêu cầu: */
-- 1. Cho biết mã số tuyến, tên tuyến, cự ly, tên đơn vị vận hành của các tuyến xe buýt có cự ly lớn hơn 20,000m.
select 
    tb.matb, 
    tb.tentuyen, 
    tb.culy, 
    dvvh.tendonvi
from tuyenbuyt tb
join dvvanhanh dvvh ON tb.madv = dvvh.madv
where tb.culy > 20000;

-- 2.    Với mỗi trạm dừng ở đường Hàm Nghi, Quận 1, cho biết mã số trạm, tên trạm và mã số các tuyến xe buýt có lộ trình qua trạm đó.
select
	td.tentram,
	GROUP_CONCAT(tb.matb SEPARATOR ', ') as danh_sach_tuyen
from tuyenbuyt tb
join lotrinh lt on tb.matb = lt.matb 
join tramdung td on lt.matd = td.matd 
where td.diadiem like '%HAM NGHI%'
and	td.diadiem LIKE '%QUAN 1%'
GROUP BY td.matd, td.tentram;

-- 3. Cho biết mã số trạm, tên trạm, loại của các trạm dừng ở Quận 12 thuộc lộ trình của các tuyến xe buýt số 3.
select 
	td.matd,
from tramdung td 
join 


USE csdl_xebuyt;

/*Các câu lệnh truy vấn select theo yêu cầu: */
-- 1. Cho biết mã số tuyến, tên tuyến, cự ly, tên đơn vị vận hành của các tuyến xe buýt có cự ly lớn hơn 20,000m.
select 
    tb.matb, 
    tb.tentuyen, 
    tb.culy, 
    dvvh.tendonvi
from tuyenbuyt tb
join dvvanhanh dvvh on tb.madv = dvvh.madv
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
	td.matd, td.tentram, td.loai
from tramdung td 
join lotrinh lt on td.matd = lt.matd
where td.diadiem like '%QUAN 12%'
and lt.matb = 3

-- 4. Cho biết mã số trạm, tên trạm, loại của các trạm dừng khởi hành của các tuyến xe buýt.
select distinct
	td.matd, td.tentram, td.loai
from tramdung td 
join lotrinh lt on td.matd = lt.matd
where lt.thututram = 1;

-- 5. Cho biết tên mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng có tên là Chợ Cũ ở Quận 1.
select
	tb.matb, tb.tentuyen 
from tuyenbuyt tb
join lotrinh lt on tb.matb = lt.matb 
join tramdung td on lt.matd = td.matd 
where td.diadiem like '%CHO CU%'
and	td.diadiem LIKE '%QUAN 1%';

-- 6. Cho biết tên đơn vị vận hành có tuyến xe buýt có lộ trình đi qua trạm dừng có mã số 53.
select dvvh.tendonvi
from dvvanhanh dvvh
join tuyenbuyt tb on dvvh.madv = tb.madv 
join lotrinh lt on tb.matb = lt.matb
where lt.matd = 53;

-- 7. Với các tuyến buýt có số chuyến trong ngày nhỏ hơn 250, cho biết mã số, tên tuyến, cự ly và tên trạm dừng khởi hành.
select tb.matb, tb.tentuyen, tb.culy, td.tentram 
from tuyenbuyt tb
join lotrinh lt on tb.matb = lt.matb 
join tramdung td on lt.matd = td.matd 
where lt.thututram = 1  
and tb.sochuyen < 250

-- 8. Cho biết mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng là bến xe trên đường Phạm Ngũ Lão ở Quận 1.
select tb.matb, tb.tentuyen
from tuyenbuyt tb
join lotrinh lt on tb.matb = lt.matb 
join tramdung td on lt.matd = td.matd
where td.diadiem like '%PHAM NGU LAO%'
and td.diadiem like '%QUAN 1%'

-- 9. Với các tuyến xe buýt do đơn vị HTX Vận tải 19/5 vận hành, cho biết mã số tuyến, tên tuyến, cự ly và lộ trình (số thứ tự trạm dừng, tên trạm, địa điểm). Sắp xếp theo mã số tuyến và số thứ tự trạm.
select tb.matb, tb.tentuyen, tb.culy, lt.thututram, td.tentram, td.diadiem
from tuyenbuyt tb
join lotrinh lt on tb.matb = lt.matb 
join tramdung td on lt.matd = td.matd 
join dvvanhanh dvvh on tb.madv = dvvh.madv
where dvvh.tendonvi = '%HTX VAN TAI 19/5%'
order by tb.matb, lt.thututram 

-- 10. Cho biết mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng có tên là Đền Thờ Ấn Giáo, Pastuer. Sắp xếp kết quả theo mã số tuyến.
select tb.matb, tb.tentuyen
from tuyenbuyt tb
join lotrinh lt on tb.matb = lt.matb 
join tramdung td on lt.matd = td.matd 
where td.diadiem like '%DEN THO AN GIAO%'
and td.diadiem like '%PASTEUR%'
order by tb.matb

-- 11. Với các trạm dừng ở Quận 1, cho biết mã số trạm, tên trạm, địa điểm, và mã số các tuyến xe buýt có lộ trình đi qua trạm đó. Sắp xếp theo tên trạm và mã số tuyến.
select 
	td.matd, td.tentram, td.diadiem, lt.matb
from tramdung td 
join lotrinh lt on td.matd = lt.matd
where td.diadiem like '%QUAN 1%'
order by td.tentram, lt.matb

-- 12. Với mỗi đơn vị vận hành cho biết tên đơn vị và mã số tuyến, cự ly của các tuyến xe buýt có lộ trình đi qua trạm dừng số 36 mà đơn vị đó đảm nhận. Sắp xếp theo tên đơn vị vận hành và mã số tuyến.
select dvvh.tendonvi, tb.matb, tb.culy
from dvvanhanh dvvh 
join tuyenbuyt tb on tb.madv = dvvh.madv 
join lotrinh lt on tb.matb = lt.matb 
where lt.matd = 36
order by dvvh.tendonvi, tb.matb
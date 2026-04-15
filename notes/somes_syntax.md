## Week 3
### `COALESCE` 
`COALESCE` : dung de noi cac cum trong mot cau lai voi nhau
Cau truc: ten_cot_1 + ' ' + COALESCE(ten_cot_2, ' ') + ...

### `GROUP_CONCAT` 
- `GROUP_CONCAT` cực kỳ hữu ích khi bạn muốn biến dữ liệu từ dạng dọc (nhiều dòng) sang dạng ngang (một dòng duy nhất) sau khi đã gom nhóm.
- Cau truc:
GROUP_CONCAT(
    [DISTINCT] cot_muon_gom 
    [ORDER BY cot_sap_xep ASC/DESC] 
    [SEPARATOR 'ky_tu_ngan_cach']
)
- Nếu danh sách tuyến của bạn vượt quá 1024 ký tự, kết quả sẽ bị cắt cụt.
- Cách khắc phục: Chạy lệnh này trước khi query nếu cần gộp chuỗi siêu dài: SET SESSION group_concat_max_len = 10000;

### TIME:
- CURRENT_TIME
- CURRENT_DATE
- CURRENT_TIMESTAMP
- EXTRACT(datepart FROM date)

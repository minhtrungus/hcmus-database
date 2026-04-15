USE csdl_doithicong;

UPDATE DOITHICONG
    SET DoiTruong = 138
    WHERE MaDoi = 2;

DELETE FROM CHAMCONG
    WHERE NgayLamViec >= '2024-04-01'
      AND NgayLamViec <= '2024-04-30';
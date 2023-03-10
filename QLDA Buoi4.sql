--Câu1: Liệt kê danh sách tất cả các nhân viên
select * from NHANVIEN
--Câu2: Tìm các nhân viên làm việc ở phòng số 5
select *  from NHANVIEN where PHG = 5
--Câu3: Liệt kê họ tên và phòng làm việc các nhân viên có mức lương trên 6.000.000 đồng
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', PHG from NHANVIEN where LUONG > 6000000
--Câu4: Tìm các nhân viên có mức lương trên 6.500.000 ở phòng 1 hoặc các nhân viên có mức lương trên 5.000.000 ở phòng 4
select * from NHANVIEN where LUONG > 650000 and PHG = 1 or LUONG > 5000000 and PHG = 4
--Câu5: Cho biết họ tên đầy đủ của các nhân viên ở TP Quảng Ngãi
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên' from NHANVIEN where DCHI like '%TP Quảng Ngãi'
--Câu6: Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên' from NHANVIEN  where HONV like 'N%' 
--Câu7: Cho biết ngày sinh và địa chỉ của nhân viên Cao Thanh Huyền
select NGSINH, DCHI from NHANVIEN where HONV like 'Cao' and TENLOT like 'Thanh' and TENNV like 'Huyền'
--Câu8: Cho biết các nhân viên có năm sinh trong khoảng 1955 đến 1975
select * from NHANVIEN where YEAR(NGSINH) between 1955 AND 1975
--Câu9: Cho biết các nhân viên và năm sinh của nhân viên
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', YEAR(NGSINH) as 'Năm sinh' from NHANVIEN
--Câu10: Cho biết họ tên và tuổi của tất cả các nhân viên
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', (2023 - YEAR(NGSINH)) as 'Tuổi' from NHANVIEN
--Câu11: Tìm tên những người trưởng phòng của từng phòng ban
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên Trưởng Phòng' from PHONGBAN,NHANVIEN
where PHONGBAN.TRPHG = NHANVIEN.MANV
--Câu12:Tìm tên và địa chỉ của tất cả các nhân viên của phòng 'Điều hành'
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', DCHI from NHANVIEN inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
where PHONGBAN.MAPHG = 4
--Câu13: Với mỗi đề án ở Tp Quảng Ngãi, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
select TENDEA, TENPHG, HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', NG_NHANCHUC 
from NHANVIEN inner join PHONGBAN 
ON NHANVIEN.PHG = PHONGBAN.MAPHG 
inner join DEAN ON DEAN.PHONG = PHONGBAN.MAPHG
where PHONGBAN.TRPHG = NHANVIEN.MANV and DCHI like '%Tp Quảng Ngãi'
--Câu14: Tìm tên những nữ nhân viên và tên người thân của họ
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', TENTN as 'Tên người thân' 
from NHANVIEN inner join THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
where NHANVIEN.PHAI = N'Nữ'
--Câu15: Với mỗi nhân viên, cho biết họ tên của nhân viên, họ tên trưởng phòng của phòng ban mà nhân viên đó đang làm việc.
select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as 'Họ và tên nhân viên', QL.HONV+ ' ' + QL.TENLOT + ' ' + QL.TENNV as 'Họ và tên quản lí'
	from NHANVIEN NV,NHANVIEN QL
	where NV.MA_NQL = QL.MANV
--Câu16: Tên những nhân viên phòng Nghiên cứu có tham gia vào đề án "Xây dựng nhà máy chế biến thủy sản"
select HONV+ ' ' + TENLOT + ' ' + TENNV as 'Họ và tên' 
from NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
where DEAN.TENDA = 'Xây dựng nhà máy chế biến thủy sản'
--Câu17: Cho biết tên các đề án mà nhân viên Trần Thanh Tâm đã tham gia.
select TENDA as 'Tên đề án'
from NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
where NHANVIEN.HONV = N'Trần' and NHANVIEN.TENLOT = N'Thanh' and NHANVIEN.TENNV = N'Tâm'
--Câu18: Cho biết số lượng đề án của công ty
SELECT COUNT(DEAN.MADA)
FROM DEAN
--Câu19: Liệt kê danh sách các phòng ban có tham gia chủ trì các đề án
SELECT * FROM DEAN,PHONGBAN 
WHERE DEAN.PHONG = PHONGBAN.MAPHG
--Câu20: Cho biết số lượng các phòng ban có tham gia chủ trì các đề án
SELECT COUNT(*) AS 'Số lượng các phòng ban tham gia chủ trì đề án' 
FROM DEAN,PHONGBAN 
WHERE DEAN.PHONG = PHONGBAN.MAPHG
--Câu21: Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì.
SELECT COUNT(DEAN.MADA)
FROM DEAN, PHONGBAN
WHERE DEAN.PHONG = PHONGBAN.MAPHG AND
PHONGBAN.TENPHG = N'Nghiên cứu'
SELECT COUNT(DEAN.MADA)
FROM DEAN, PHONGBAN
WHERE DEAN.PHONG = PHONGBAN.MAPHG AND
PHONGBAN.TENPHG = N'Nghiên cứu'
--Câu22: Cho biết lương trung bình của các nữ nhân viên.
SELECT AVG(NHANVIEN.LUONG)
FROM NHANVIEN
WHERE NHANVIEN.PHAI = N'Nữ'
--Câu23: Cho biết số thân nhân của nhân viên 'Đinh Bá Tiến'.
SELECT COUNT(THANNHAN.MA_NVIEN)
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN AND NHANVIEN.HONV = N'Đinh' AND NHANVIEN.TENLOT = N'Bá' AND NHANVIEN.TENNV = N'Tiến'
--Câu24: Liệt kê danh sách 3 nhân viên lớn tuổi nhất, danh sách bao gồm họ tên và năm sinh.
SELECT TOP 3 HONV + ' ' + TENLOT + ' ' + TENNV + ' ' AS 'Họ và tên',year(NGSINH) AS 'Năm sinh' 
FROM NHANVIEN
ORDER BY year(NGSINH)
--Câu25: Với mỗi đề án, liệt kê mã đề án và tổng số giờ làm việc của tất cả các nhân viên tham gia đề án đó.
SELECT DEAN.MADA, COUNT(DEAN.MADA) AS 'Số lượng công việc'
FROM DEAN, CONGVIEC
WHERE DEAN.MADA = CONGVIEC.MADA
GROUP BY DEAN.MADA, DEAN.TENDA
--Câu26: Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc của tất cả các nhân viên tham gia đề án đó.
SELECT DEAN.TENDA, COUNT(DEAN.MADA) AS 'Số lượng công việc'
FROM DEAN, CONGVIEC
WHERE DEAN.MADA = CONGVIEC.MADA
GROUP BY DEAN.MADA, DEAN.TENDA
--Câu27: Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó, thông tin bao gồm tên đề án và số lượng nhân viên.
SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', COUNT(THANNHAN.MA_NVIEN) AS 'Số lượng thân nhân'
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)
--Câu28:Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', COUNT(THANNHAN.MA_NVIEN) AS 'Số lượng thân nhân'
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)
--Câu29:Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', COUNT(PHANCONG.MA_NVIEN) AS'Số lượng đề án tham gia'
FROM NHANVIEN, DEAN, PHANCONG
WHERE NHANVIEN.MANV = PHANCONG.MA_NVIEN AND DEAN.MADA = PHANCONG.MADA
GROUP BY (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)
--Câu30: Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, AVG(NHANVIEN.LUONG) AS 'Lương trung bình'
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.PHG = PHONGBAN.MAPHG
GROUP BY PHONGBAN.MAPHG, PHONGBAN.TENPHG
--Câu31:Với các phòng ban có mức lương trung bình trên 5.200.000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
SELECT PHONGBAN.TENPHG, COUNT(NHANVIEN.MANV) AS N'Số lượng nhân viên'
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.PHG = PHONGBAN.MAPHG
GROUP BY PHONGBAN.TENPHG
HAVING AVG(NHANVIEN.LUONG)>5200000
--Câu32: Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì.
SELECT PHONGBAN.TENPHG, COUNT(DEAN.PHONG) AS 'Số lượng đề án'
FROM PHONGBAN, DEAN
WHERE PHONGBAN.MAPHG = DEAN.PHONG
GROUP BY PHONGBAN.TENPHG
--Câu33: Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì.
SELECT PHONGBAN.TENPHG, (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên trưởng phòng', COUNT(DEAN.PHONG) AS 'Số lượng đề án'
FROM NHANVIEN, PHONGBAN, DEAN
WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND PHONGBAN.MAPHG = DEAN.PHONG
GROUP BY PHONGBAN.TENPHG, (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)
--Câu34: Với mỗi đề án, cho biết tên đề án và số lượng nhân viên tham gia đề án
SELECT DEAN.MADA, DEAN.TENDA, COUNT(DEAN.MADA) AS 'Số lượng công việc'
FROM DEAN, CONGVIEC
WHERE DEAN.MADA = CONGVIEC.MADA
GROUP BY DEAN.MADA, DEAN.TENDA

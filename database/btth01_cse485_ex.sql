-- Liệt kê các bài viết về các bài hát thuộc thể loại Nhạc trữ tình
SELECT baiviet.*
FROM baiviet
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
WHERE theloai.ten_tloai = 'Nhạc trữ tình';

--	Liệt kê các bài viết của tác giả “Nhacvietplus” 
SELECT baiviet.*
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
WHERE tacgia.ten_tgia = 'Nhacvietplus';

-- Liệt kê các thể loại nhạc chưa có bài viết cảm nhận nào.
SELECT theloai.*
FROM theloai
WHERE NOT EXISTS (
    SELECT 1
    FROM baiviet
    WHERE baiviet.ma_tloai = theloai.ma_tloai
        AND baiviet.noidung IS NOT NULL
);

-- Liệt kê các bài viết với các thông tin sau: mã bài viết, tên bài viết, tên bài hát, tên tác giả, tên thể loại, ngày viết
SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat, tacgia.ten_tgia, theloai.ten_tloai, baiviet.ngayviet
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai;

--	Tìm thể loại có số bài viết nhiều nhất 
SELECT theloai.ten_tloai, COUNT(baiviet.ma_bviet) AS so_bai_viet
FROM theloai
LEFT JOIN baiviet ON theloai.ma_tloai = baiviet.ma_tloai
GROUP BY theloai.ten_tloai
ORDER BY so_bai_viet DESC
LIMIT 1;
--
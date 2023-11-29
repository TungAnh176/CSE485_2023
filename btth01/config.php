<?php 
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "btth01_cse485";

    try {
        // Tạo kết nối đến MySQL
        $conn = new mysqli($servername, $username, $password, $dbname);

        echo "Kết nối thành công";
    
        // Thực hiện các thao tác với cơ sở dữ liệu ở đây (nếu cần)
    
    } catch (Exception $e) {
        // Bắt và hiển thị lỗi nếu có
        echo "Lỗi: " . $e->getMessage();
    }
?>
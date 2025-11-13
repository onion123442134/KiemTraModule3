CREATE DATABASE IF NOT EXISTS RoomRentalDB;
USE RoomRentalDB;

CREATE TABLE PaymentMethod (
    id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL
);

INSERT INTO PaymentMethod (method_name)
VALUES ('Theo tháng'), ('Theo quý'), ('Theo năm');

CREATE TABLE Room (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_name VARCHAR(50) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    start_date DATE NOT NULL,
    payment_id INT NOT NULL,
    note VARCHAR(200),
    FOREIGN KEY (payment_id) REFERENCES PaymentMethod(id)
);

-- Dữ liệu mẫu cho bảng Room
INSERT INTO Room (tenant_name, phone, start_date, payment_id, note)
VALUES
('Nguyễn Văn A', '0987654321', '2025-01-15', 1, 'Thuê phòng tầng 2, có máy lạnh'),
('Trần Thị B', '0912345678', '2025-02-01', 2, 'Thuê theo quý, không thú cưng'),
('Lê Hoàng C', '0909988776', '2025-03-10', 3, 'Cọc 2 tháng, thuê theo năm'),
('Phạm Thị D', '0966666666', '2025-04-05', 1, 'Phòng nhỏ, gần cầu thang'),
('Đỗ Minh E', '0977777777', '2025-05-20', 2, 'Phòng hướng Đông, nhiều ánh sáng');
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý thuê phòng trọ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h2 {
            font-weight: 700;
            color: #0d6efd;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        .table {
            border-radius: 8px;
            overflow: hidden;
        }

        .table thead {
            background-color: #0d6efd;
            color: white;
            font-weight: 600;
        }

        .table tbody tr {
            transition: all 0.3s;
        }

        .table tbody tr:hover {
            background-color: #e7f1ff;
            transform: scale(1.01);
        }

        .btn {
            font-weight: 500;
            transition: all 0.2s;
        }

        .btn-primary:hover {
            background-color: #0b5ed7;
        }

        .btn-success:hover {
            background-color: #198754;
        }

        .btn-danger:hover {
            background-color: #dc3545;
        }

        .form-control {
            border-radius: 50px;
            padding: 0.5rem 1rem;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
        }

        .container {
            max-width: 1200px;
            margin-top: 30px;
        }

        input[type="checkbox"] {
            width: 20px;
            height: 20px;
        }

        .table {
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mb-4 text-center">Quản lý thuê phòng trọ</h2>

    <!-- Form tìm kiếm + tạo mới -->
    <form class="mb-3 d-flex align-items-center" method="get" action="room">
        <input type="hidden" name="action" value="list">
        <input type="text" name="keyword" placeholder="Tìm kiếm theo mã, tên hoặc SĐT..."
               class="form-control w-50 me-2" value="${param.keyword}">
        <button class="btn btn-primary me-2">Tìm</button>
        <a href="room?action=form" class="btn btn-success me-2">Tạo mới</a>
    </form>

    <!-- Form xóa -->
    <form method="get" action="room">
        <input type="hidden" name="action" value="delete">

        <table class="table table-bordered table-hover bg-white">
            <thead class="text-center">
            <tr>
                <th>Chọn</th>
                <th>Mã phòng</th>
                <th>Tên người thuê</th>
                <th>Số điện thoại</th>
                <th>Ngày bắt đầu thuê</th>
                <th>Hình thức thanh toán</th>
                <th>Ghi chú</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${empty rooms}">
                <tr>
                    <td colspan="7" class="text-center text-muted">Không có dữ liệu</td>
                </tr>
            </c:if>

            <c:forEach var="r" items="${rooms}">
                <tr>
                    <td class="text-center">
                        <input type="checkbox" name="roomId" value="${r.roomId}">
                    </td>
                    <td class="fw-bold">PT-${r.roomId}</td>
                    <td>${r.tenantName}</td>
                    <td>${r.phone}</td>
                    <td>${r.startDate}</td>
                    <td>${r.paymentName}</td>
                    <td>${r.note}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="text-end">
            <button type="submit" class="btn btn-danger mt-2">Xóa</button>
        </div>
    </form>
</div>

</body>
</html>

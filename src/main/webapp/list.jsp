<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
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
            text-align: center;
            margin-bottom: 30px;
        }

        .table {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .table thead {
            background-color: #0d6efd;
            color: white;
            font-weight: 600;
        }

        .table tbody tr:hover {
            background-color: #e7f1ff;
            transform: scale(1.01);
            transition: 0.3s;
        }

        .form-control, .form-select, textarea {
            border-radius: 8px;
            padding: 0.5rem 1rem;
        }

        .btn {
            font-weight: 500;
            transition: all 0.2s;
        }

        .card-body {
            background-color: #ffffff;
        }

        .text-danger {
            font-size: 0.875rem;
        }

        @media (max-width: 768px) {
            .form-inline input, .form-inline select, .form-inline button {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Quản lý thuê phòng trọ</h2>
    <form class="mb-3 d-flex align-items-center" method="get" action="room">
        <input type="hidden" name="action" value="list">
        <input type="text" name="keyword" placeholder="Tìm kiếm theo Mã phòng, Tên hoặc SĐT..."
               class="form-control me-2" value="${param.keyword}">
        <button type="submit" class="btn btn-primary">Tìm</button>
    </form>
    <!-- Nút hiển thị form tạo mới -->
    <button class="btn btn-success mb-3" type="button" data-bs-toggle="collapse" data-bs-target="#createForm" aria-expanded="${not empty errors}" aria-controls="createForm">
        Tạo mới
    </button>

    <!-- Form tạo mới -->
    <div class="collapse mb-4 ${not empty errors ? 'show' : ''}" id="createForm">
        <div class="card card-body shadow-sm">
            <form method="post" action="room">
                <div class="mb-3">
                    <label class="form-label">Tên người thuê</label>
                    <input type="text" name="tenantName" class="form-control" required
                           value="${tenantName != null ? tenantName : ''}">
                    <c:if test="${not empty errors['tenantName']}">
                        <div class="text-danger">${errors['tenantName']}</div>
                    </c:if>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số điện thoại</label>
                    <input type="text" name="phone" class="form-control" required
                           value="${phone != null ? phone : ''}">
                    <c:if test="${not empty errors['phone']}">
                        <div class="text-danger">${errors['phone']}</div>
                    </c:if>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ngày bắt đầu</label>
                    <input type="date" name="startDate" class="form-control" required
                           value="${startDate != null ? startDate : ''}">
                    <c:if test="${not empty errors['startDate']}">
                        <div class="text-danger">${errors['startDate']}</div>
                    </c:if>
                </div>
                <div class="mb-3">
                    <label class="form-label">Hình thức thanh toán</label>
                    <select name="paymentId" class="form-select" required>
                        <option value="">-- Chọn --</option>
                        <option value="1" ${paymentId == '1' ? 'selected' : ''}>Theo tháng</option>
                        <option value="2" ${paymentId == '2' ? 'selected' : ''}>Theo quý</option>
                        <option value="3" ${paymentId == '3' ? 'selected' : ''}>Theo năm</option>
                    </select>
                    <c:if test="${not empty errors['paymentId']}">
                        <div class="text-danger">${errors['paymentId']}</div>
                    </c:if>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ghi chú</label>
                    <textarea name="note" class="form-control">${note != null ? note : ''}</textarea>
                    <c:if test="${not empty errors['note']}">
                        <div class="text-danger">${errors['note']}</div>
                    </c:if>
                </div>
                <button type="submit" class="btn btn-success">Lưu</button>
            </form>
        </div>
    </div>

    <!-- Bảng danh sách -->
    <form method="get" action="room">
        <input type="hidden" name="action" value="delete">
        <table class="table table-bordered table-hover">
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
                    <td class="text-center"><input type="checkbox" name="roomId" value="${r.roomId}"></td>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

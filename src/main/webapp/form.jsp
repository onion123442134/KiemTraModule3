<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tạo mới thuê phòng trọ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="p-4">
<h3>Tạo mới thông tin thuê trọ</h3>
<form method="post" action="room">
    <div class="mb-3">
        <label>Tên người thuê</label>
        <input type="text" name="tenantName" class="form-control"
               value="${tenantName != null ? tenantName : ''}"
               pattern="^[A-Za-zÀ-ỹà-ỹ\\s]{5,50}$"
               title="Chỉ được nhập chữ cái (có dấu), không chứa số hoặc ký tự đặc biệt, từ 5–50 ký tự"
               required>
        <c:if test="${not empty errors['tenantName']}">
            <div class="text-danger">${errors['tenantName']}</div>
        </c:if>
    </div>


    <div class="mb-3">
        <label>Số điện thoại</label>
        <input type="text" name="phone" class="form-control"
               value="${phone != null ? phone : ''}" pattern="[0-9]{10}" required>
        <c:if test="${not empty errors['phone']}">
            <div class="text-danger">${errors['phone']}</div>
        </c:if>
    </div>

    <div class="mb-3">
        <label>Ngày bắt đầu</label>
        <input type="date" name="startDate" class="form-control"
               value="${startDate != null ? startDate : ''}" required>
        <c:if test="${not empty errors['startDate']}">
            <div class="text-danger">${errors['startDate']}</div>
        </c:if>
    </div>

    <div class="mb-3">
        <label>Hình thức thanh toán</label>
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
        <label>Ghi chú</label>
        <textarea name="note" maxlength="200" class="form-control">${note != null ? note : ''}</textarea>
        <c:if test="${not empty errors['note']}">
            <div class="text-danger">${errors['note']}</div>
        </c:if>
    </div>

    <button class="btn btn-success">Tạo mới</button>
    <a href="room?action=list" class="btn btn-secondary">Hủy</a>
</form>
</body>
</html>

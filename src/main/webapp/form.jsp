<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Tạo mới thuê phòng trọ</title>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">--%>
<%--    <style>--%>
<%--        body {--%>
<%--            background-color: #f5f7fa;--%>
<%--            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--%>
<%--        }--%>

<%--        h3 {--%>
<%--            text-align: center;--%>
<%--            color: #0d6efd;--%>
<%--            margin-bottom: 30px;--%>
<%--            font-weight: 700;--%>
<%--            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);--%>
<%--        }--%>

<%--        form {--%>
<%--            max-width: 600px;--%>
<%--            margin: auto;--%>
<%--            background-color: #ffffff;--%>
<%--            padding: 30px;--%>
<%--            border-radius: 12px;--%>
<%--            box-shadow: 0 8px 20px rgba(0,0,0,0.08);--%>
<%--        }--%>

<%--        .form-control, .form-select, textarea {--%>
<%--            border-radius: 8px;--%>
<%--            padding: 0.6rem 1rem;--%>
<%--            box-shadow: inset 0 1px 3px rgba(0,0,0,0.05);--%>
<%--            transition: all 0.3s;--%>
<%--        }--%>

<%--        .form-control:focus, .form-select:focus, textarea:focus {--%>
<%--            border-color: #0d6efd;--%>
<%--            box-shadow: 0 0 6px rgba(13,110,253,0.25);--%>
<%--            outline: none;--%>
<%--        }--%>

<%--        label {--%>
<%--            font-weight: 600;--%>
<%--        }--%>

<%--        .text-danger {--%>
<%--            font-size: 0.875rem;--%>
<%--            margin-top: 0.25rem;--%>
<%--        }--%>

<%--        button.btn-success {--%>
<%--            width: 120px;--%>
<%--            font-weight: 600;--%>
<%--            transition: all 0.2s;--%>
<%--        }--%>

<%--        button.btn-success:hover {--%>
<%--            background-color: #198754;--%>
<%--        }--%>

<%--        a.btn-secondary {--%>
<%--            width: 120px;--%>
<%--            font-weight: 600;--%>
<%--        }--%>

<%--        .mb-3 {--%>
<%--            margin-bottom: 1.5rem !important;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body class="p-4">--%>

<%--<h3>Tạo mới thông tin thuê trọ</h3>--%>

<%--<form method="post" action="room">--%>
<%--    <div class="mb-3">--%>
<%--        <label>Tên người thuê</label>--%>
<%--        <input type="text" name="tenantName" class="form-control"--%>
<%--               value="${tenantName != null ? tenantName : ''}"--%>
<%--               pattern="^[A-Za-zÀ-ỹà-ỹ\\s]{5,50}$"--%>
<%--               title="Chỉ được nhập chữ cái (có dấu), không chứa số hoặc ký tự đặc biệt, từ 5–50 ký tự"--%>
<%--               required>--%>
<%--        <c:if test="${not empty errors['tenantName']}">--%>
<%--            <div class="text-danger">${errors['tenantName']}</div>--%>
<%--        </c:if>--%>
<%--    </div>--%>

<%--    <div class="mb-3">--%>
<%--        <label>Số điện thoại</label>--%>
<%--        <input type="text" name="phone" class="form-control"--%>
<%--               value="${phone != null ? phone : ''}" pattern="[0-9]{10}" required>--%>
<%--        <c:if test="${not empty errors['phone']}">--%>
<%--            <div class="text-danger">${errors['phone']}</div>--%>
<%--        </c:if>--%>
<%--    </div>--%>

<%--    <div class="mb-3">--%>
<%--        <label>Ngày bắt đầu</label>--%>
<%--        <input type="date" name="startDate" class="form-control"--%>
<%--               value="${startDate != null ? startDate : ''}" required>--%>
<%--        <c:if test="${not empty errors['startDate']}">--%>
<%--            <div class="text-danger">${errors['startDate']}</div>--%>
<%--        </c:if>--%>
<%--    </div>--%>

<%--    <div class="mb-3">--%>
<%--        <label>Hình thức thanh toán</label>--%>
<%--        <select name="paymentId" class="form-select" required>--%>
<%--            <option value="">-- Chọn --</option>--%>
<%--            <option value="1" ${paymentId == '1' ? 'selected' : ''}>Theo tháng</option>--%>
<%--            <option value="2" ${paymentId == '2' ? 'selected' : ''}>Theo quý</option>--%>
<%--            <option value="3" ${paymentId == '3' ? 'selected' : ''}>Theo năm</option>--%>
<%--        </select>--%>
<%--        <c:if test="${not empty errors['paymentId']}">--%>
<%--            <div class="text-danger">${errors['paymentId']}</div>--%>
<%--        </c:if>--%>
<%--    </div>--%>

<%--    <div class="mb-3">--%>
<%--        <label>Ghi chú</label>--%>
<%--        <textarea name="note" maxlength="200" class="form-control">${note != null ? note : ''}</textarea>--%>
<%--        <c:if test="${not empty errors['note']}">--%>
<%--            <div class="text-danger">${errors['note']}</div>--%>
<%--        </c:if>--%>
<%--    </div>--%>

<%--    <div class="d-flex justify-content-between mt-4">--%>
<%--        <button class="btn btn-success">Tạo mới</button>--%>
<%--        <a href="room?action=list" class="btn btn-secondary">Hủy</a>--%>
<%--    </div>--%>
<%--</form>--%>

<%--</body>--%>
<%--</html>--%>

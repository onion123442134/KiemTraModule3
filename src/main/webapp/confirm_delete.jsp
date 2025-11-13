<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Xác nhận xóa</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="p-4">
<h3>Xác nhận xóa thông tin thuê trọ</h3>
<%
    String[] ids = (String[]) request.getAttribute("ids");
    if (ids != null) {
        out.print("<p>Bạn có muốn xóa thông tin thuê trọ ");
        for (int i = 0; i < ids.length; i++) {
            out.print("PT-" + ids[i]);
            if (i < ids.length - 1) out.print(", ");
        }
        out.println(" không?</p>");
    }
%>

<form method="get" action="room">
    <input type="hidden" name="action" value="confirmDelete">
    <%
        if (ids != null) {
            for (String id : ids) {
                out.println("<input type='hidden' name='ids' value='" + id + "'>");
            }
        }
    %>
    <button type="submit" class="btn btn-danger">Có</button>
    <a href="room?action=list" class="btn btn-secondary">Không</a>
</form>
</body>
</html>

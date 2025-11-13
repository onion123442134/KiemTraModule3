package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Room;
import service.IRoomService;
import service.RoomServiceImpl;

@WebServlet("/room")
public class RoomController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final IRoomService service = new RoomServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null || action.trim().isEmpty()) {
            action = "list";
        }

        switch (action) {
            case "list": {
                String keyword = req.getParameter("keyword");
                req.setAttribute("rooms", service.getAll(keyword));

                req.setAttribute("tenantName", "");
                req.setAttribute("phone", "");
                req.setAttribute("startDate", "");
                req.setAttribute("paymentId", "");
                req.setAttribute("note", "");
                req.getRequestDispatcher("list.jsp").forward(req, resp);
                break;
            }

            case "delete": {
                String[] ids = req.getParameterValues("roomId");
                if (ids == null || ids.length == 0) {
                    resp.sendRedirect("room?action=list");
                    return;
                }
                req.setAttribute("ids", ids);
                req.getRequestDispatcher("confirm_delete.jsp").forward(req, resp);
                break;
            }

            case "confirmDelete": {
                String[] ids = req.getParameterValues("ids");
                if (ids != null && ids.length > 0) {
                    service.delete(ids);
                }
                resp.sendRedirect("room?action=list");
                break;
            }

            default: {
                resp.sendRedirect("room?action=list");
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String tenantName = req.getParameter("tenantName");
        String phone = req.getParameter("phone");
        String startDateStr = req.getParameter("startDate"); // yyyy-MM-dd
        String paymentIdStr = req.getParameter("paymentId");
        String note = req.getParameter("note");

        Map<String, String> errors = new HashMap<>();

        if (tenantName == null || tenantName.trim().isEmpty()) {
            errors.put("tenantName", "Tên người thuê là bắt buộc.");
        } else {
            String t = tenantName.trim();
            if (t.length() < 5 || t.length() > 50) {
                errors.put("tenantName", "Độ dài tên phải từ 5 đến 50 ký tự.");
            } else if (!t.matches("^[\\p{L}\\s]+$")) {
                errors.put("tenantName", "Tên chỉ được chứa chữ cái và dấu tiếng Việt, không được chứa số hoặc ký tự đặc biệt.");
            }
        }

        if (phone == null || phone.trim().isEmpty()) {
            errors.put("phone", "Số điện thoại là bắt buộc.");
        } else {
            String p = phone.trim();
            if (!p.matches("\\d{10}")) {
                errors.put("phone", "Số điện thoại phải gồm đúng 10 chữ số.");
            } else if (service.isPhoneExist(p)) {
                errors.put("phone", "Số điện thoại đã tồn tại, vui lòng nhập số khác.");
            }
        }

        if (startDateStr == null || startDateStr.trim().isEmpty()) {
            errors.put("startDate", "Ngày bắt đầu thuê là bắt buộc.");
        } else {
            try {
                java.time.LocalDate startDate = java.time.LocalDate.parse(startDateStr);
                java.time.LocalDate today = java.time.LocalDate.now();
                if (startDate.isBefore(today)) {
                    errors.put("startDate", "Ngày bắt đầu không được là ngày trong quá khứ.");
                }
            } catch (java.time.format.DateTimeParseException ex) {
                errors.put("startDate", "Ngày bắt đầu không đúng định dạng.");
            }
        }

        int paymentId = -1;
        if (paymentIdStr == null || paymentIdStr.trim().isEmpty()) {
            errors.put("paymentId", "Hình thức thanh toán là bắt buộc.");
        } else {
            try {
                paymentId = Integer.parseInt(paymentIdStr);
                if (paymentId < 1 || paymentId > 3) {
                    errors.put("paymentId", "Hình thức thanh toán không hợp lệ.");
                }
            } catch (NumberFormatException ex) {
                errors.put("paymentId", "Hình thức thanh toán không hợp lệ.");
            }
        }

        if (note != null && note.length() > 200) {
            errors.put("note", "Ghi chú không được vượt quá 200 ký tự.");
        }

        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.setAttribute("tenantName", tenantName);
            req.setAttribute("phone", phone);
            req.setAttribute("startDate", startDateStr);
            req.setAttribute("paymentId", paymentIdStr);
            req.setAttribute("note", note);

            String keyword = req.getParameter("keyword");
            req.setAttribute("rooms", service.getAll(keyword));

            req.getRequestDispatcher("list.jsp").forward(req, resp);
            return;
        }

        Room r = new Room();
        r.setTenantName(tenantName.trim());
        r.setPhone(phone.trim());
        r.setStartDate(startDateStr);
        r.setPaymentId(paymentId);
        r.setNote(note == null ? "" : note.trim());

        service.add(r);

        resp.sendRedirect("room?action=list");
    }
}

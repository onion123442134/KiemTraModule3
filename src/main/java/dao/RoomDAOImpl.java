package dao;

import java.sql.*;
import java.util.*;

import model.Room;
import util.DBConnection;

public class RoomDAOImpl implements IRoomDAO {

    @Override
    public List<Room> findAll(String keyword) {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT r.*, p.method_name FROM Room r JOIN PaymentMethod p ON r.payment_id=p.id";
        if (keyword != null && !keyword.isEmpty()) {
            sql += " WHERE r.room_id LIKE ? OR r.tenant_name LIKE ? OR r.phone LIKE ?";
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(1, "%" + keyword + "%");
                ps.setString(2, "%" + keyword + "%");
                ps.setString(3, "%" + keyword + "%");
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Room(
                        rs.getInt("room_id"),
                        rs.getString("tenant_name"),
                        rs.getString("phone"),
                        rs.getString("start_date"),
                        rs.getInt("payment_id"),
                        rs.getString("method_name"),
                        rs.getString("note")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean insert(Room r) {
        String sql = "INSERT INTO Room(tenant_name, phone, start_date, payment_id, note) VALUES(?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, r.getTenantName());
            ps.setString(2, r.getPhone());
            ps.setString(3, r.getStartDate());
            ps.setInt(4, r.getPaymentId());
            ps.setString(5, r.getNote());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(String[] ids) {
        if (ids == null || ids.length == 0) return false;
        String sql = "DELETE FROM Room WHERE room_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            for (String id : ids) {
                ps.setInt(1, Integer.parseInt(id));
                ps.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}

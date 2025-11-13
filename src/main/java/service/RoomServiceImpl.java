package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import dao.IRoomDAO;
import dao.RoomDAOImpl;
import model.Room;

import static util.DBConnection.getConnection;

public class RoomServiceImpl implements IRoomService {
    private IRoomDAO dao = new RoomDAOImpl();

    @Override
    public List<Room> getAll(String keyword) {
        return dao.findAll(keyword);
    }

    @Override
    public boolean add(Room r) {
        return dao.insert(r);
    }

    @Override
    public boolean delete(String[] ids) {
        return dao.delete(ids);
    }

    @Override
    public boolean isPhoneExist(String phone) {
        String sql = "SELECT COUNT(*) FROM Room WHERE phone = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

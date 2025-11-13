package dao;

import java.util.List;

import model.Room;

public interface IRoomDAO {
    List<Room> findAll(String keyword);

    boolean insert(Room room);

    boolean delete(String[] ids);
}

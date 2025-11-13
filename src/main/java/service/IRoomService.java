package service;

import java.util.List;

import model.Room;

public interface IRoomService {
    List<Room> getAll(String keyword);

    boolean add(Room r);

    boolean delete(String[] ids);

    boolean isPhoneExist(String phone);
}

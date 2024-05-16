package dao;

import entity.User;

public interface UserDao extends GenericDao<User, Integer>, AutoCloseable {
    void close();
}

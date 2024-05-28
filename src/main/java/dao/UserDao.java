package dao;

import entity.User;

import java.util.Optional;

public interface UserDao extends GenericDao<User, Integer>, AutoCloseable {
    Optional<User> getUserByUsername(String username);
    void close();
}

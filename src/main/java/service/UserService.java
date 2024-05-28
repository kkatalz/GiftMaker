package service;

import converter.UserDtoUserConverter;
import dao.DaoFactory;
import dao.UserDao;
import dto.UserDto;
import entity.User;

import java.text.ParseException;
import java.util.List;
import java.util.Optional;

public class UserService {

    private final DaoFactory daoFactory;

    public UserService(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    private static class Holder {
        static final UserService INSTANCE = new UserService(DaoFactory.getDaoFactory());
    }

    public static UserService getInstance() {
        return Holder.INSTANCE;
    }


    /**
     *
     * @param username
     * @return User if user with such username exists, otherwise returns Optional.empty
     */
    public Optional<User> getUserByUsername(String username) {
        try(UserDao userDao = daoFactory.createUserDao()) {
            return userDao.getUserByUsername(username);
        }
    }

    public List<User> getAllUsers() {
        try(UserDao userDao = daoFactory.createUserDao()) {
            return userDao.getAll();
        }
    }



    public Optional<User> getUserById(int id) {
        try(UserDao userDao = daoFactory.createUserDao()) {
            return userDao.getById(id);
        }
    }


    public void createUser(UserDto dto) throws ParseException {
        User user = UserDtoUserConverter.toUser(dto);
        try(UserDao userDao = daoFactory.createUserDao()) {
            userDao.create(user);
        }
    }


    public void updateUser(UserDto dto) throws ParseException {
        User user = UserDtoUserConverter.toUser(dto);
        try(UserDao userDao = daoFactory.createUserDao()) {
            userDao.update(user);
        }
    }


    public void deleteUser(int idUser) {
        try(UserDao userDao = daoFactory.createUserDao()) {
            userDao.delete(idUser);
        }
    }
}

package service;

import dao.DaoFactory;
import dao.jdbc.JdbcLikedItemDao;
import entity.LikedItem;

import java.util.List;
import java.util.Optional;

public class LikedItemService {

    private final DaoFactory daoFactory;

    public LikedItemService(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    private static class Holder {
        static final LikedItemService  INSTANCE = new LikedItemService(DaoFactory.getDaoFactory());
    }

    public static LikedItemService getInstance() {
        return Holder.INSTANCE;
    }


    public List<LikedItem> getAll() {
        try(JdbcLikedItemDao likedItemDao = daoFactory.createLikedItemDao()) {
            return likedItemDao.getAll();
        }
    }


    public Optional<LikedItem> getById(int userId, int itemId) {
        try(JdbcLikedItemDao likedItemDao = daoFactory.createLikedItemDao()) {
            return likedItemDao.getById(userId, itemId);
        }
    }


    public List<LikedItem> getLikedItemsByUserId(int userId) {
        try(JdbcLikedItemDao likedItemDao = daoFactory.createLikedItemDao()) {
            return likedItemDao.getByUserId(userId);
        }
    }


    public void createLikedItem(LikedItem likedItem) {
        try(JdbcLikedItemDao likedItemDao = daoFactory.createLikedItemDao()) {
            likedItemDao.create(likedItem);
        }
    }


    public void deleteLikedItem(int userId, int itemId) {
        try(JdbcLikedItemDao likedItemDao = daoFactory.createLikedItemDao()) {
            likedItemDao.delete(userId, itemId);
        }
    }
}

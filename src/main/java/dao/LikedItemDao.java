package dao;

import entity.LikedItem;

public interface LikedItemDao extends GenericDao<LikedItem, Integer>, AutoCloseable {
    void close();
}

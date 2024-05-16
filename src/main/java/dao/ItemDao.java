package dao;

import entity.Item;

public interface ItemDao extends GenericDao<Item, Integer>, AutoCloseable {
    void close();
}

package dao;

import entity.PossibleItem;

public interface PossibleItemDao extends GenericDao<PossibleItem, Integer>, AutoCloseable {
    void close();
}

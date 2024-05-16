package dao;

public interface ItemInCartDao extends GenericDao<ItemInCartDao, Integer>, AutoCloseable{
    void close();
}

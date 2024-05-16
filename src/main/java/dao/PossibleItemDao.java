package dao;

public interface PossibleItemDao extends GenericDao<PossibleItemDao, Integer>, AutoCloseable {
    void close();
}

package dao;

import java.util.List;
import java.util.Optional;

public interface GenericDao<T, K> {
    List<T> getAll();
    Optional<T> getById(K id);
    void create(T t);
    void update(T t);
    void delete(K id);
}

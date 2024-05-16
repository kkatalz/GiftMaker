package dao;

import entity.Category;

public interface CategoryDao extends GenericDao<Category, Integer>, AutoCloseable {
    void close();
}

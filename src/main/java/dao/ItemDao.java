package dao;

import entity.Category;
import entity.Item;

import java.math.BigDecimal;
import java.util.List;

public interface ItemDao extends GenericDao<Item, Integer>, AutoCloseable {
    List<Item> filterItemsByCategoryByPriceByAge(Category category, BigDecimal minPrice, BigDecimal maxPrice, int age);
    List<Item> filterByCategoryName(Category category);
    List<Item> filterByPrice(BigDecimal minPrice, BigDecimal maxPrice);
    List<Item> filterByAge(int age);
    void close();
}

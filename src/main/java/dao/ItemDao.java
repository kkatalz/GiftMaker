package dao;

import entity.Category;
import entity.Item;

import java.math.BigDecimal;
import java.util.List;

public interface ItemDao extends GenericDao<Item, Integer>, AutoCloseable {
    List<Item> filterItemsByCategoryByPriceByAge(List<Category> categories, BigDecimal minPrice, BigDecimal maxPrice, int minAge,
                                                        int maxAge);
    List<Item> filterByCategoryName(List<Category> categories);
    List<Item> filterByPrice(BigDecimal minPrice, BigDecimal maxPrice);
    List<Item> filterByAge(int minAge, int maxAge);
    List<Item> searchByItemNameOrId(String nameOrId);
    void saveImages(Item item);
    List<String> getBase64ImagesByItemId(Integer itemId);
    void close();
}

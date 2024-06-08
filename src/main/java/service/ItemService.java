package service;

import converter.ItemDtoItemConverter;
import dao.DaoFactory;
import dao.ItemDao;
import dto.ItemDto;
import entity.Category;
import entity.Item;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class ItemService {
    private final DaoFactory daoFactory;

    public ItemService(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    private static class Holder {
        static final ItemService INSTANCE = new ItemService(DaoFactory.getDaoFactory());
    }

    public static ItemService getInstance() {
        return Holder.INSTANCE;
    }


    public List<Item> filterItems(List<Category> categories, BigDecimal minPrice, BigDecimal maxPrice, int minAge,
                                  int maxAge) {
        boolean isCategories = categories != null && !categories.isEmpty();
        boolean isPrice = minPrice != null && maxPrice != null;
        boolean isAge = minAge != 0 && maxAge != 0;

        // filter by all parameters
        if(isCategories && isPrice && isAge)
            return filterItemsByCategoryByPriceByAge(categories, minPrice, maxPrice, minAge, maxAge);

        // by categories and price
        if(isCategories && isPrice) {
            List<Item> byCategories = filterItemsByCategoryName(categories);
            List<Item> byPrice = filterByPrice(minPrice, maxPrice);

            return getIntersection(byCategories, byPrice);
        }

        // by categories and age
        if(isCategories && isAge) {
            List<Item> byCategories = filterItemsByCategoryName(categories);
            List<Item> byAge = filterByAge(minAge, maxAge);
            return getIntersection(byCategories, byAge);
        }


        // by price and age
        if(isPrice && isAge) {
            List<Item> byAge = filterByAge(minAge, maxAge);
            List<Item> byPrice = filterByPrice(minPrice, maxPrice);

            return getIntersection(byAge, byPrice);

        }

        // filter by category
        if(isCategories)
            return filterItemsByCategoryName(categories);


        // filter by price
        if(isPrice)
            return filterByPrice(minPrice, maxPrice);

        // filter by age
        if(isAge)
            return filterByAge(minAge, maxAge);

        return new ArrayList<>();
    }



    public List<Item> filterItemsByCategoryByPriceByAge(List<Category> categories, BigDecimal minPrice, BigDecimal maxPrice, int minAge,
                                                        int maxAge) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.filterItemsByCategoryByPriceByAge(categories, minPrice, maxPrice, minAge, maxAge);
        }
    }

    public List<Item> filterItemsByCategoryName(List<Category> categories) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.filterByCategoryName(categories);
        }
    }

    public List<Item> filterByPrice(BigDecimal minPrice, BigDecimal maxPrice) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.filterByPrice(minPrice, maxPrice);
        }
    }

    public List<Item> filterByAge(int minAge, int maxAge) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.filterByAge(minAge, maxAge);
        }
    }


    public List<Item> searchItemByNameOrId(String nameOrId) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.searchByItemNameOrId(nameOrId);
        }
    }

    public List<Item> getAllItems() {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.getAll();
        }
    }

    public Optional<Item> getById(Integer id) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.getById(id);
        }
    }

    public void create(ItemDto dto) {
        Item item = ItemDtoItemConverter.toItem(dto);
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            itemDao.create(item);
            itemDao.saveImages(item);
        }
    }

    public void update(ItemDto dto) {
        Item item = ItemDtoItemConverter.toItem(dto);
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            itemDao.update(item);
        }
    }

    public void delete(Integer id) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            itemDao.delete(id);
        }
    }

    public List<String> getBase64ImagesByItemId(Integer itemId) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.getBase64ImagesByItemId(itemId);
        }
    }

    private List<Item> getIntersection(List<Item> items1, List<Item> items2) {
        Set<Integer> set1 = new HashSet<>();
        for (Item item : items1)
            set1.add(item.getId());

        List<Item> intersection = new ArrayList<>();
        for (Item item : items2) {
            if (set1.contains(item.getId()))
                intersection.add(item);

        }

        return intersection;
    }

}

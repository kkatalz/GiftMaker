package service;

import dao.DaoFactory;
import dao.ItemDao;
import entity.Category;
import entity.Item;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

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


    public List<Item> filterItemsByCategoryByPriceByAge(Category category, BigDecimal minPrice, BigDecimal maxPrice, int age) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.filterItemsByCategoryByPriceByAge(category, minPrice, maxPrice, age);
        }
    }

    public List<Item> filterItemsByCategoryName(Category category) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.filterByCategoryName(category);
        }
    }

    public List<Item> filterByPrice(BigDecimal minPrice, BigDecimal maxPrice) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.filterByPrice(minPrice, maxPrice);
        }
    }

    public List<Item> filterByAge(int age) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.filterByAge(age);
        }
    }


    public List<Item> searchItemByName(String name) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            return itemDao.searchByItemName(name);
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

    public void create(Item item) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            itemDao.create(item);
        }
    }

    public void update(Item item) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            itemDao.update(item);
        }
    }

    public void delete(Integer id) {
        try(ItemDao itemDao = daoFactory.createItemDao()) {
            itemDao.delete(id);
        }
    }

}

package service;

import converter.ItemDtoItemConverter;
import dao.DaoFactory;
import dao.ItemDao;
import dto.ItemDto;
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

}

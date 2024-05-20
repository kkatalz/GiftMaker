package service;

import converter.ItemInCartDtoConverter;
import dao.DaoFactory;
import dao.jdbc.JdbcItemInCartDao;
import dto.ItemInCartDto;
import entity.ItemInCart;

import java.util.List;
import java.util.Optional;

public class ItemInCartService {

    private final DaoFactory daoFactory;

    public ItemInCartService(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    private static class Holder {
        static final ItemInCartService INSTANCE = new ItemInCartService(DaoFactory.getDaoFactory());
    }

    public static ItemInCartService getInstance() {
        return Holder.INSTANCE;
    }



    public List<ItemInCart> getAll() throws Exception {
        try(JdbcItemInCartDao itemInCartDao = daoFactory.createItemInCartDao()) {
            return itemInCartDao.getAll();
        }
    }



    public Optional<ItemInCart> getById(int userId, int itemId) throws Exception {
        try(JdbcItemInCartDao itemInCartDao = daoFactory.createItemInCartDao()) {
            return itemInCartDao.getById(userId, itemId);
        }
    }


    /**
     * Get all items in cart by user id.
     * @param userId user id
     * @return List of ItemInCart of specific user
     * @throws Exception
     */
    public List<ItemInCart> getItemsInCartByUserId(int userId) throws Exception {
        try(JdbcItemInCartDao itemInCartDao = daoFactory.createItemInCartDao()) {
            return itemInCartDao.getByUserId(userId);
        }
    }


    public void createItemInCart(ItemInCartDto dto) throws Exception {
        ItemInCart itemInCart = ItemInCartDtoConverter.toItemInCart(dto);
        try(JdbcItemInCartDao itemInCartDao = daoFactory.createItemInCartDao()) {
            itemInCartDao.create(itemInCart);
        }
    }

    public void deleteItemInCart(int userId, int itemId) throws Exception {
        try(JdbcItemInCartDao itemInCartDao = daoFactory.createItemInCartDao()) {
            itemInCartDao.delete(userId, itemId);
        }
    }
}

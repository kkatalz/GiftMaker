package service;

import dao.CategoryDao;
import dao.DaoFactory;
import entity.Category;

import java.util.List;
import java.util.Optional;

public class CategoryService {

    private final DaoFactory daoFactory;

    public CategoryService(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    private static class Holder {
        static final CategoryService INSTANCE = new CategoryService(DaoFactory.getDaoFactory());
    }

    public static CategoryService getInstance() {
        return Holder.INSTANCE;
    }


    public List<Category> getAllCategories() {
        try(CategoryDao  categoryDao = daoFactory.createCategoryDao()) {
            return categoryDao.getAll();
        }
    }

    public Optional<Category> getCategoryById(int id) {
        try (CategoryDao categoryDao = daoFactory.createCategoryDao()) {
            return categoryDao.getById(id);
        }
    }

    public void createCategory(Category category) {
        try (CategoryDao categoryDao = daoFactory.createCategoryDao()) {
            categoryDao.create(category);
        }
    }

    public void updateCategory(Category category) {
        try (CategoryDao categoryDao = daoFactory.createCategoryDao()){
            categoryDao.update(category);
        }
    }

    public void deleteCategory(int id) {
        try (CategoryDao categoryDao = daoFactory.createCategoryDao()) {
            categoryDao.delete(id);
        }
    }
}

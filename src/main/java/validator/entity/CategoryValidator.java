package validator.entity;


import entity.Category;
import locale.Message;
import service.CategoryService;
import validator.field.AbstractFieldValidatorHandler;
import validator.field.FieldValidatorKey;
import validator.field.FieldValidatorsChainGenerator;

import java.util.ArrayList;
import java.util.List;

public class CategoryValidator implements Validator<Category> {
    private AbstractFieldValidatorHandler fieldValidator = FieldValidatorsChainGenerator.getFieldValidatorChain();

    private static class Holder {
        static final CategoryValidator INSTANCE = new CategoryValidator();
    }

    public static CategoryValidator getInstance() {
        return Holder.INSTANCE;
    }

    @Override
    public List<String> validate(Category category) {
        List<String> errors = new ArrayList<>();
        fieldValidator.validateField(FieldValidatorKey.NAME, category.getName(), errors);

        List<Category> categories = CategoryService.getInstance().getAllCategories();
        for(Category current: categories) {
            if(current.getName().equalsIgnoreCase(category.getName()))
                errors.add("Category with this name already exists");
        }

        return errors;
    }
}

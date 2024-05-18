package validator.entity;

import dto.ItemDto;
import validator.field.AbstractFieldValidatorHandler;
import validator.field.FieldValidatorKey;
import validator.field.FieldValidatorsChainGenerator;

import java.util.ArrayList;
import java.util.List;

public class ItemDtoValidator implements Validator<ItemDto> {

    private AbstractFieldValidatorHandler fieldValidator = FieldValidatorsChainGenerator.getFieldValidatorChain();

    private static class Holder {
        static final ItemDtoValidator INSTANCE = new ItemDtoValidator();
    }

    public static ItemDtoValidator getInstance() {
        return Holder.INSTANCE;
    }

    @Override
    public List<String> validate(ItemDto dto) {
        List<String> errors = new ArrayList<>();
        fieldValidator.validateField(FieldValidatorKey.NAME, dto.getName(), errors);
        fieldValidator.validateField(FieldValidatorKey.PRICE, dto.getPrice(), errors);
        fieldValidator.validateField(FieldValidatorKey.DESCRIPTION, dto.getDescription(), errors);
        fieldValidator.validateField(FieldValidatorKey.AMOUNT, dto.getAmount(), errors);
        fieldValidator.validateField(FieldValidatorKey.AGE, dto.getAge(), errors);

        return errors;
    }
}

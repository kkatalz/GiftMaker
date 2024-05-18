package validator.entity;

import dto.ItemInCartDto;
import validator.field.AbstractFieldValidatorHandler;
import validator.field.FieldValidatorKey;
import validator.field.FieldValidatorsChainGenerator;

import java.util.ArrayList;
import java.util.List;

public class ItemInCartDtoValidator implements Validator<ItemInCartDto> {
    private AbstractFieldValidatorHandler fieldValidator = FieldValidatorsChainGenerator.getFieldValidatorChain();

    private static class Holder {
        static final ItemInCartDtoValidator INSTANCE = new ItemInCartDtoValidator();
    }

    public static ItemInCartDtoValidator getInstance() {
        return ItemInCartDtoValidator.Holder.INSTANCE;
    }
    @Override
    public List<String> validate(ItemInCartDto dto) {
        List<String> errors = new ArrayList<>();
        fieldValidator.validateField(FieldValidatorKey.AMOUNT, dto.getAmount(), errors);
        return errors;
    }
}

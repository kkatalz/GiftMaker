package validator.entity;

import dto.PossibleItemDto;
import locale.Message;
import validator.field.AbstractFieldValidatorHandler;
import validator.field.FieldValidatorKey;
import validator.field.FieldValidatorsChainGenerator;

import java.util.ArrayList;
import java.util.List;

public class PossibleItemDtoValidator implements Validator<PossibleItemDto> {

    private AbstractFieldValidatorHandler fieldValidator = FieldValidatorsChainGenerator.getFieldValidatorChain();

    private static class Holder {
        static final PossibleItemDtoValidator INSTANCE = new PossibleItemDtoValidator();
    }

    public static PossibleItemDtoValidator getInstance() {
        return Holder.INSTANCE;
    }

    @Override
    public List<String> validate(PossibleItemDto dto) {
        List<String> errors = new ArrayList<>();
        fieldValidator.validateField(FieldValidatorKey.NAME, dto.getName(), errors);
        fieldValidator.validateField(FieldValidatorKey.PRICE, dto.getPrice(), errors);
        fieldValidator.validateField(FieldValidatorKey.DESCRIPTION, dto.getDescription(), errors);
        fieldValidator.validateField(FieldValidatorKey.AGE, dto.getAge(), errors);
        if(dto.getParts().isEmpty())
            errors.add(Message.INVALID_IMAGES);

        return errors;
    }
}

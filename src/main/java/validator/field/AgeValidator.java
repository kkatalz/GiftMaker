package validator.field;

import locale.Message;

import java.util.List;

public class AgeValidator extends AbstractFieldValidatorHandler{
    private static final String AGE_REGEX = "^(100|[1-9]?\\d)$";

    AgeValidator(FieldValidatorKey fieldValidatorKey) {
        super(fieldValidatorKey);
    }

    private static class Holder {
        static final AgeValidator INSTANCE = new AgeValidator(FieldValidatorKey.AGE);
    }

    public static AgeValidator getInstance() {
        return AgeValidator.Holder.INSTANCE;
    }

    @Override
    public void validateField(String fieldValue, List<String> errors) {
        if(fieldValue.isEmpty() || !fieldValue.matches(AGE_REGEX))
            errors.add(Message.INVALID_RECOMMENDED_AGE);
    }
}

package validator.field;

import locale.Message;

import java.util.List;

public class AmountValidator extends AbstractFieldValidatorHandler{
    private static final String AMOUNT_REGEX = "^\\d+$";

    AmountValidator(FieldValidatorKey fieldValidatorKey) {
        super(fieldValidatorKey);
    }

    private static class Holder {
        static final AmountValidator INSTANCE = new AmountValidator(FieldValidatorKey.AMOUNT);
    }

    public static AmountValidator getInstance() {
        return AmountValidator.Holder.INSTANCE;
    }

    @Override
    public void validateField(String fieldValue, List<String> errors) {
        if(fieldValue.isEmpty() || !fieldValue.matches(AMOUNT_REGEX))
            errors.add(Message.INVALID_AMOUNT);
    }
}

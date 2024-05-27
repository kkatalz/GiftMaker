package validator.field;

import locale.Message;

import java.util.List;

public class SurnameValidator extends AbstractFieldValidatorHandler {

    SurnameValidator(FieldValidatorKey fieldValidatorKey) {
        super(fieldValidatorKey);
    }

    private static class Holder {
        static final SurnameValidator INSTANCE = new SurnameValidator(FieldValidatorKey.SURNAME);
    }

    public static SurnameValidator getInstance() {
        return SurnameValidator.Holder.INSTANCE;
    }

    @Override
    public void validateField(String fieldValue, List<String> errors) {
        if(fieldValue.isEmpty() || fieldValue.length() > 100)
            errors.add(Message.INVALID_SURNAME);
    }
}

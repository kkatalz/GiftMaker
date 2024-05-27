package validator.field;

import locale.Message;

import java.util.List;

public class NameValidator extends AbstractFieldValidatorHandler {

    NameValidator(FieldValidatorKey fieldValidatorKey) {
        super(fieldValidatorKey);
    }

    private static class Holder {
        static final NameValidator INSTANCE = new NameValidator(FieldValidatorKey.NAME);
    }

    public static NameValidator getInstance() {
        return NameValidator.Holder.INSTANCE;
    }

    @Override
    public void validateField(String fieldValue, List<String> errors) {
        if(fieldValue.isEmpty() || fieldValue.length() > 100)
            errors.add(Message.INVALID_NAME);
    }
}

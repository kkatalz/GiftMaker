package validator.field;

import locale.Message;

import java.util.List;

public class PasswordValidator extends AbstractFieldValidatorHandler {

    private static final String REGEX = "^.{4,}$";
    PasswordValidator(FieldValidatorKey fieldValidatorKey) {
        super(fieldValidatorKey);
    }

    private static class Holder {
        static final PasswordValidator INSTANCE = new PasswordValidator(FieldValidatorKey.PASSWORD);
    }

    public static PasswordValidator getInstance() {
        return PasswordValidator.Holder.INSTANCE;
    }

    @Override
    void validateField(String fieldValue, List<String> errors) {
        if(fieldValue.isEmpty() || !fieldValue.matches(REGEX) || fieldValue.length() > 200)
            errors.add(Message.INVALID_PASSWORD);
    }
}

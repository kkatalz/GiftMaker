package validator.field;

import locale.Message;

import java.util.List;

public class UsernameValidator extends AbstractFieldValidatorHandler {

    private static final String REGEX = "^.{4,}$";
    UsernameValidator(FieldValidatorKey fieldValidatorKey) {
        super(fieldValidatorKey);
    }

    private static class Holder {
        static final UsernameValidator INSTANCE = new UsernameValidator(FieldValidatorKey.USERNAME);
    }

    public static UsernameValidator getInstance() {
        return UsernameValidator.Holder.INSTANCE;
    }

    @Override
    void validateField(String fieldValue, List<String> errors) {
        if(fieldValue.isEmpty() || !fieldValue.matches(REGEX) || fieldValue.length() > 100)
            errors.add(Message.INVALID_USERNAME);
    }
}

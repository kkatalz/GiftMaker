package validator.field;

import locale.Message;

import java.util.List;

public class DescriptionValidator extends AbstractFieldValidatorHandler {

    DescriptionValidator(FieldValidatorKey fieldValidatorKey) {
        super(fieldValidatorKey);
    }

    private static class Holder {
        static final DescriptionValidator INSTANCE = new DescriptionValidator(FieldValidatorKey.DESCRIPTION);
    }

    public static DescriptionValidator getInstance() {
        return DescriptionValidator.Holder.INSTANCE;
    }

    @Override
    public void validateField(String fieldValue, List<String> errors) {
        if(fieldValue.isEmpty() || fieldValue.length() > 100)
            errors.add(Message.INVALID_DESCRIPTION);
    }
}

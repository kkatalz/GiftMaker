package validator.field;

import locale.Message;

import java.util.List;

public class PriceValidator extends AbstractFieldValidatorHandler{

    private static final String SELLING_PRICE_REGEX = "^\\d{1,13}\\.?\\d{0,2}$";

    PriceValidator(FieldValidatorKey fieldValidatorKey) {
        super(fieldValidatorKey);
    }

    private static class Holder {
        static final PriceValidator INSTANCE = new PriceValidator(FieldValidatorKey.PRICE);
    }

    public static PriceValidator getInstance() {
        return PriceValidator.Holder.INSTANCE;
    }

    @Override
    public void validateField(String fieldValue, List<String> errors) {
        if(fieldValue.isEmpty() || !fieldValue.matches(SELLING_PRICE_REGEX))
            errors.add(Message.INVALID_PRICE);
    }
}

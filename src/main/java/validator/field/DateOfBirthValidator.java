package validator.field;

import locale.Message;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeParseException;
import java.util.List;

public class DateOfBirthValidator extends AbstractFieldValidatorHandler{

    DateOfBirthValidator(FieldValidatorKey fieldValidatorKey) {
        super(fieldValidatorKey);
    }

    private static class Holder {
        static final DateOfBirthValidator INSTANCE = new DateOfBirthValidator(FieldValidatorKey.DATE_OF_BIRTH);
    }

    public static DateOfBirthValidator getInstance() {
        return DateOfBirthValidator.Holder.INSTANCE;
    }

    @Override
    public void validateField(String fieldValue, List<String> errors) {
        if(fieldValue.isEmpty())
            return;

        LocalDate dateOfBirth;
        try {
            dateOfBirth = LocalDate.parse(fieldValue);
        } catch (DateTimeParseException e) {
            errors.add(Message.INVALID_DATE_OF_BIRTH);
            return;
        }

        if(!isValidAge(dateOfBirth))
            errors.add(Message.INVALID_DATE_OF_BIRTH);
    }

    /**
     * Check whether age is >= 14 years.
     * @param dateOfBirth
     * @return
     */
    private static boolean isValidAge(LocalDate dateOfBirth) {
        LocalDate currentDate = LocalDate.now();
        Period period = Period.between(dateOfBirth, currentDate);
        return period.getYears() >= 14;
    }
}

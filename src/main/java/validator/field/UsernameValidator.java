package validator.field;

import entity.User;
import locale.Message;
import service.UserService;

import java.util.List;
import java.util.Optional;

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

        // in case there is already user with such username
        Optional<User> userWithGivenUsername = UserService.getInstance().getUserByUsername(fieldValue);
        if(userWithGivenUsername.isPresent())
            errors.add(Message.INVALID_USERNAME_WITH_REGISTRATION);
    }
}

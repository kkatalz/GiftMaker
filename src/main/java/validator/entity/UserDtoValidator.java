package validator.entity;

import dto.UserDto;
import locale.Message;
import validator.field.AbstractFieldValidatorHandler;
import validator.field.FieldValidatorKey;
import validator.field.FieldValidatorsChainGenerator;

import java.util.ArrayList;
import java.util.List;

public class UserDtoValidator implements Validator<UserDto> {

    private AbstractFieldValidatorHandler fieldValidator = FieldValidatorsChainGenerator.getFieldValidatorChain();

    private static class Holder {
        static final UserDtoValidator INSTANCE = new UserDtoValidator();
    }

    public static UserDtoValidator getInstance() {
        return UserDtoValidator.Holder.INSTANCE;
    }

    @Override
    public List<String> validate(UserDto dto) {
        List<String> errors = new ArrayList<>();
        fieldValidator.validateField(FieldValidatorKey.NAME, dto.getName(), errors);
        fieldValidator.validateField(FieldValidatorKey.SURNAME, dto.getSurname(), errors);
        fieldValidator.validateField(FieldValidatorKey.DATE_OF_BIRTH, dto.getDateOfBirth(), errors);
        fieldValidator.validateField(FieldValidatorKey.USERNAME, dto.getUsername(), errors);
        fieldValidator.validateField(FieldValidatorKey.PASSWORD, dto.getPassword(), errors);

        if(!dto.getPassword().equals(dto.getConfirmPassword()))
            errors.add(Message.INVALID_PASSWORD_AND_CONFIRM);
        return errors;
    }
}

package validator.field;

public class FieldValidatorsChainGenerator {

    public static AbstractFieldValidatorHandler getFieldValidatorChain() {
        AbstractFieldValidatorHandler ageValidator = AgeValidator.getInstance();
        AbstractFieldValidatorHandler amountValidator = AmountValidator.getInstance();
        AbstractFieldValidatorHandler dateOfBirthValidator = DateOfBirthValidator.getInstance();
        AbstractFieldValidatorHandler descriptionValidator = DescriptionValidator.getInstance();
        AbstractFieldValidatorHandler nameValidator = NameValidator.getInstance();
        AbstractFieldValidatorHandler passwordValidator = PasswordValidator.getInstance();

        AbstractFieldValidatorHandler priceValidator = PriceValidator.getInstance();
        AbstractFieldValidatorHandler surnameValidator = SurnameValidator.getInstance();
        AbstractFieldValidatorHandler usernameValidator = UsernameValidator.getInstance();

        ageValidator.setNextFieldValidator(amountValidator);
        amountValidator.setNextFieldValidator(dateOfBirthValidator);
        dateOfBirthValidator.setNextFieldValidator(descriptionValidator);
        descriptionValidator.setNextFieldValidator(nameValidator);
        nameValidator.setNextFieldValidator(passwordValidator);
        passwordValidator.setNextFieldValidator(priceValidator);
        priceValidator.setNextFieldValidator(surnameValidator);
        surnameValidator.setNextFieldValidator(usernameValidator);

        return ageValidator;
    }
}

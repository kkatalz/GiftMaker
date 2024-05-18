package validator.field;

public enum FieldValidatorKey {
    NAME("name"),
    PRICE("price"),
    DESCRIPTION("description"),
    AMOUNT("amount"),
    AGE("age"),
    SURNAME("surname"),
    DATE_OF_BIRTH("date_birth"),
    USERNAME("username"),
    PASSWORD("password");

    private String value;

    FieldValidatorKey(String value){}

    public String getValue(){
        return value;
    }
}

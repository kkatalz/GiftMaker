package entity;

import locale.Message;

public enum Role {
    MANAGER("administrator", Message.ROLE_ADMIN),
    CASHIER("client", Message.ROLE_CLIENT);

    private String value;
    private String localizedValue;

    Role(String value) {
        this.value = value;
    }

    Role(String value, String localizedValue) {
        this.value  = value;
        this.localizedValue = localizedValue;
    }

    public String getValue() {
        return value;
    }

    public String getLocalizedValue() {
        return localizedValue;
    }

    public static Role forValue(String value) {
        for (Role role: Role.values()) {
            if (role.getValue().equalsIgnoreCase(value))
                return role;
        }
        throw new RuntimeException("No role with that value.");
    }
}

package dto;

import entity.CustomBuilder;
import entity.Role;

public class UserDto {

    private Integer id;
    private String name;
    private String surname;
    private String dateOfBirth;
    private Role role;
    private String username;
    private String clearPassword;
    private String confirmPassword;


    public static class Builder implements CustomBuilder<UserDto> {
        UserDto user = new UserDto();

        public Builder setId(int id) {
            user.id = id;
            return this;
        }

        public Builder setName(String name) {
            user.name = name;
            return this;
        }

        public Builder setSurname(String surname) {
            user.surname = surname;
            return this;
        }

        public Builder setDateOfBirth(String dateOfBirth) {
            user.dateOfBirth = dateOfBirth;
            return this;
        }

        public Builder setRole(Role role) {
            user.role = role;
            return this;
        }

        public Builder setUsername(String username) {
            user.username = username;
            return this;
        }


        public Builder setPassword(String password) {
            user.clearPassword = password;
            return this;
        }

        public Builder setConfirmPassword(String confirmPassword) {
            user.confirmPassword = confirmPassword;
            return this;
        }

        @Override
        public UserDto build() {
            return user;
        }
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return clearPassword;
    }

    public void setPassword(String encryptedPassword) {
        this.clearPassword = encryptedPassword;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", role=" + role +
                ", username='" + username + '\'' +
                ", clearPassword='" + clearPassword + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                '}';
    }
}

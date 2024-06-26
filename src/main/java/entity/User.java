package entity;

import java.sql.Date;

public class User {
    private Integer id;
    private String name;
    private String surname;
    private Date dateOfBirth;
    private Role role;
    private String username;
    private String encryptedPassword;


    public static class Builder implements CustomBuilder<User> {
        User user = new User();

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

        public Builder setDateOfBirth(Date dateOfBirth) {
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


        public Builder setEncryptedPassword(String encryptedPassword) {
            user.encryptedPassword = encryptedPassword;
            return this;
        }

        @Override
        public User build() {
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

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
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

    public String getEncryptedPassword() {
        return encryptedPassword;
    }

    public void setEncryptedPassword(String encryptedPassword) {
        this.encryptedPassword = encryptedPassword;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", role=" + role +
                ", username='" + username + '\'' +
                ", encryptedPassword='" + encryptedPassword + '\'' +
                '}';
    }
}

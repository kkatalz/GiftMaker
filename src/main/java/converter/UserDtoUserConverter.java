package converter;

import dto.UserDto;
import entity.User;
import org.mindrot.jbcrypt.BCrypt;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class UserDtoUserConverter {

    public static User toUser(UserDto dto) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDateOfBirth = formatter.parse(dto.getDateOfBirth());
        java.sql.Date sqlDateOfBirth = new java.sql.Date(utilDateOfBirth.getTime());

        String encryptedPassword = BCrypt.hashpw(dto.getPassword(), BCrypt.gensalt());

        return new User.Builder()
                .setName(dto.getName())
                .setSurname(dto.getSurname())
                .setDateOfBirth(sqlDateOfBirth)
                .setRole(dto.getRole())
                .setUsername(dto.getUsername())
                .setEncryptedPassword(encryptedPassword)
                .build();

    }
}

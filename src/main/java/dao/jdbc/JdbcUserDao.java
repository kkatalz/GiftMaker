package dao.jdbc;

import dao.UserDao;
import entity.Role;
import entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class JdbcUserDao implements UserDao {
    private static final String ID = "id_user";
    private static final String NAME = "name";
    private static final String SURNAME = "surname";
    private static final String BIRTH_DATE = "date_birth";
    private static final String ROLE = "role";
    private static final String USERNAME = "username";
    private static final String PASSWORD = "password";
    private static final String GET_ALL = "SELECT * FROM User";
    private static final String GET_BY_ID = "SELECT * FROM User WHERE id_user=?";
    private static final String CREATE = "INSERT INTO User (name, surname, date_birth, role, username, password) " +
            "VALUES (?, ?, ?, ?, ?, ?)";

    private static final String UPDATE = "UPDATE User SET name=?, surname=?, date_birth=?, role=?, username=?, " +
            "password=? WHERE id_user=?";
    private static final String DELETE = "DELETE FROM User WHERE id_user=?";

    private Connection connection;
    private boolean connectionShouldBeClosed;

    public JdbcUserDao(Connection connection) {
        this.connection = connection;
        connectionShouldBeClosed = false;
    }


    public JdbcUserDao(Connection connection, boolean connectionShouldBeClosed) {
        this.connection = connection;
        this.connectionShouldBeClosed = connectionShouldBeClosed;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }
    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        try(Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(GET_ALL)) {
            while(resultSet.next())
                users.add(getUserFromResultSet(resultSet));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    @Override
    public Optional<User> getById(Integer id) {
        Optional<User> user = Optional.empty();

        try (PreparedStatement statement = connection.prepareStatement(GET_BY_ID)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
                user = Optional.of(getUserFromResultSet(resultSet));

        } catch (SQLException e) {
           e.printStackTrace();
        }
        return user;
    }

    @Override
    public void create(User user) {
        try (PreparedStatement query = connection.prepareStatement(CREATE, Statement.RETURN_GENERATED_KEYS)) {
            query.setString(1, user.getName());
            query.setString(2, user.getSurname());
            query.setString(3, user.getDateOfBirth().toString());
            query.setString(4, user.getRole().getValue());
            query.setString(5, user.getUsername());
            query.setString(6, user.getEncryptedPassword());

            query.executeUpdate();

            ResultSet keys = query.getGeneratedKeys();
            if (keys.next())
                user.setId(keys.getInt(1));

        } catch (SQLException e) {
//            LOGGER.error("JdbcCategoryDao create error" + category, e);
//            throw new ServerException(e);
            e.printStackTrace();
        }
    }

    @Override
    public void update(User user) {
        try (PreparedStatement query = connection.prepareStatement(UPDATE)) {
            query.setString(1, user.getName());
            query.setString(2, user.getSurname());
            query.setString(3, user.getDateOfBirth().toString());
            query.setString(4, user.getRole().getValue());
            query.setString(5, user.getUsername());
            query.setString(6, user.getEncryptedPassword());
            query.setInt(7, user.getId());

            query.executeUpdate();
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            //LOGGER.error("JdbcCategoryDao update error" + category, e);
            //throw new ServerException(e);
        }
    }

    @Override
    public void delete(Integer id) {
        try (PreparedStatement statement = connection.prepareStatement(DELETE)) {
            statement.setInt(1, id);
            statement.executeUpdate();

        } catch (SQLException e) {
//            LOGGER.error("JdbcEmployeeDao delete SQL exception" + id, e);
//            throw new ServerException(e);
            e.printStackTrace();
        }

    }

    @Override
    public void close() {
        if (connectionShouldBeClosed) {
            try {
                connection.close();
            } catch (SQLException e) {
                //LOGGER.error("JdbcItemDao close error", e);
                //throw new ServerException(e);
                e.printStackTrace();
            }
        }
    }


    protected static User getUserFromResultSet(ResultSet resultSet) throws SQLException {
        String temp = resultSet.getString(BIRTH_DATE);
        java.sql.Date dateOfBirth = java.sql.Date.valueOf(temp);

        return new User.Builder()
                .setId(resultSet.getInt(ID))
                .setName(resultSet.getString(NAME))
                .setSurname(resultSet.getString(SURNAME))
                .setDateOfBirth(dateOfBirth)
                .setRole(Role.forValue(resultSet.getString(ROLE)))
                .setUsername(resultSet.getString(USERNAME))
                .setEncryptedPassword(resultSet.getString(PASSWORD))
                .build();

    }
}

package dao.jdbc;

import dao.CategoryDao;
import entity.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class JdbcCategoryDao implements CategoryDao {
    private static final String ID = "id_category";
    private static final String CATEGORY_NAME = "category_name";
    private Connection connection;
    private boolean connectionShouldBeClosed;

    private final static String GET_ALL = "SELECT * FROM Category ORDER BY category_name";
    private final static String GET_BY_ID = "SELECT * FROM Category WHERE id_category=?";
    private final static String CREATE = "INSERT INTO Category (category_name) VALUES (?)";
    private final static String UPDATE =  "UPDATE Category SET category_name=? WHERE id_category=?";
    private final static String DELETE = "DELETE FROM Category WHERE id_category=?";
    public JdbcCategoryDao(Connection connection) {
        this.connection = connection;
        connectionShouldBeClosed = false;
    }


    public JdbcCategoryDao(Connection connection, boolean connectionShouldBeClosed) {
        this.connection = connection;
        this.connectionShouldBeClosed = connectionShouldBeClosed;
    }

    protected static Category getCategoryFromResultSet(ResultSet resultSet) throws SQLException {
        return new Category.Builder().setCategoryId(resultSet.getInt(ID)).setName(resultSet.getString(CATEGORY_NAME)).build();
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void close() {
        if (connectionShouldBeClosed) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                //LOGGER.error("JdbcCategoryDao close error", e);
                //throw new ServerException(e);
            }
        }
    }

    @Override
    public List<Category> getAll() {
        List<Category> categories = new ArrayList<>();

        try (Statement query = connection.createStatement();
             ResultSet resultSet = query.executeQuery(GET_ALL)) {
            while (resultSet.next())
                categories.add(getCategoryFromResultSet(resultSet));

        } catch (SQLException e) {
            System.out.println("EXCEPTION: " + e);
           // LOGGER.error("JdbcCategoryDao getAll error", e);
            return new ArrayList<>();
        }
        return categories;
    }

    @Override
    public Optional<Category> getById(Integer id) {
        Optional<Category> category = Optional.empty();

        try (PreparedStatement statement = connection.prepareStatement(GET_BY_ID)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                category = Optional.of(getCategoryFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            System.out.println("EXCEPTION: " + e.getMessage());
            //LOGGER.error("JdbcCategoryDao getById error" + id, e);
            //throw new ServerException(e);
        }
        return category;
    }

    @Override
    public void create(Category category) {
        try (PreparedStatement query = connection.prepareStatement(CREATE, Statement.RETURN_GENERATED_KEYS)) {
            query.setString(1, category.getName());
            query.executeUpdate();

            ResultSet keys = query.getGeneratedKeys();
            if (keys.next())
                category.setId(keys.getInt(1));

        } catch (SQLException e) {
//            LOGGER.error("JdbcCategoryDao create error" + category, e);
//            throw new ServerException(e);
            System.out.println("ERROR: " + e);
        }
    }

    @Override
    public void update(Category category) {
        try (PreparedStatement query = connection.prepareStatement(UPDATE)) {
            query.setString(1, category.getName());
            query.setInt(2, category.getId());
            query.executeUpdate();
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            //LOGGER.error("JdbcCategoryDao update error" + category, e);
            //throw new ServerException(e);
        }
    }

    @Override
    public void delete(Integer id) {
        try (PreparedStatement query = connection.prepareStatement(DELETE)) {
            query.setInt(1, id);
            query.executeUpdate();
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
            //LOGGER.error("JdbcCategoryDao delete error" + category_number, e);
            //throw new ServerException(e);
        }
    }
}

package dao.jdbc;

import entity.ItemInCart;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class JdbcItemInCartDao implements AutoCloseable {

    private static final String GET_ALL = "SELECT * FROM Item_In_Cart " +
            "INNER JOIN User USING(id_user) " +
            "INNER JOIN Item USING(id_item) " +
            "INNER JOIN Category USING(id_category)";
    private static final String GET_BY_ID = "SELECT * FROM Item_In_Cart " +
            "INNER JOIN User USING(id_user) " +
            "INNER JOIN Item USING(id_item) " +
            "INNER JOIN Category USING(id_category) " +
            "WHERE id_user=? AND id_item=?";

    private static final String GET_BY_USER_ID = "SELECT * FROM Item_In_Cart " +
            "INNER JOIN User USING(id_user) " +
            "INNER JOIN Item USING(id_item) " +
            "INNER JOIN Category USING(id_category) " +
            "WHERE id_user=?";
    private static final String CREATE = "INSERT INTO Item_In_Cart VALUES (?, ?, ?)";
    private static final String DELETE = "DELETE FROM Item_In_Cart WHERE id_user=? AND id_item=?";

    private static final String AMOUNT = "item_amount";

    private Connection connection;
    private boolean connectionShouldBeClosed;

    public JdbcItemInCartDao(Connection connection) {
        this.connection = connection;
        connectionShouldBeClosed = false;
    }


    public JdbcItemInCartDao(Connection connection, boolean connectionShouldBeClosed) {
        this.connection = connection;
        this.connectionShouldBeClosed = connectionShouldBeClosed;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }


    public List<ItemInCart> getAll() {
        List<ItemInCart> itemInCarts = new ArrayList<>();
        try (Statement query = connection.createStatement();
             ResultSet resultSet = query.executeQuery(GET_ALL)) {

            while (resultSet.next())
                itemInCarts.add(getItemInCartFromResultSet(resultSet));

        } catch (SQLException e) {
            System.out.println("EXCEPTION: " + e);
            // LOGGER.error("JdbcCategoryDao getAll error", e);
            return new ArrayList<>();
        }
        return itemInCarts;
    }

    public Optional<ItemInCart> getById(Integer userId, Integer itemId) {
        Optional<ItemInCart> itemInCart = Optional.empty();

        try (PreparedStatement statement = connection.prepareStatement(GET_BY_ID)) {
            statement.setInt(1, userId);
            statement.setInt(2, itemId);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                itemInCart = Optional.of(getItemInCartFromResultSet(resultSet));
            }
        } catch (SQLException e) {
           e.printStackTrace();
        }
        return itemInCart;
    }

    public List<ItemInCart> getByUserId(Integer userId) {
        List<ItemInCart> itemsInCart = new ArrayList<>();
        try(PreparedStatement statement = connection.prepareStatement(GET_BY_USER_ID)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next())
                itemsInCart.add(getItemInCartFromResultSet(resultSet));

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return itemsInCart;
    }

    public void create(ItemInCart itemInCart) {
        try(PreparedStatement statement = connection.prepareStatement(CREATE)) {
            statement.setInt(1, itemInCart.getUser().getId());
            statement.setInt(2, itemInCart.getItem().getId());
            statement.setInt(3, itemInCart.getAmount());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(Integer userId, Integer itemId) {
        try (PreparedStatement query = connection.prepareStatement(DELETE)) {
            query.setInt(1, userId);
            query.setInt(2, itemId);

            query.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void close() throws Exception {
        if (connectionShouldBeClosed) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected static ItemInCart getItemInCartFromResultSet(ResultSet resultSet) throws SQLException {
        return new ItemInCart.Builder()
                .setUser(JdbcUserDao.getUserFromResultSet(resultSet))
                .setItem(JdbcItemDao.getItemFromResultSet(resultSet))
                .setAmount(resultSet.getInt(AMOUNT))
                .build();
    }
}

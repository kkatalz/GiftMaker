package dao.jdbc;

import dao.ItemDao;
import entity.Item;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class JdbcItemDao implements ItemDao {
    private static final String ID = "id_item";
    private static final String NAME = "item_name";
    private static final String PRICE = "item_price";
    private static final String DESCRIPTION = "description";
    private static final String AMOUNT = "amount";
    private static final String AGE = "age";
    private static final String IMAGE = "image";

    private final static String GET_ALL = "SELECT * FROM Item INNER JOIN Category USING (id_category)";
    private final static String GET_BY_ID = "SELECT * FROM Item INNER JOIN Category USING(id_category) WHERE id_item=?";
    private final static String CREATE = "INSERT INTO Item (id_category, item_name, item_price, description, amount, age, image) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?)";
    private final static String UPDATE =  "UPDATE Item SET id_category=?, item_name=?, item_price=?, description=?, " +
            "amount=?, age=?, image=? WHERE id_item=?";
    private final static String DELETE = "DELETE FROM Item WHERE id_item=?";

    private Connection connection;
    private boolean connectionShouldBeClosed;

    public JdbcItemDao(Connection connection) {
        this.connection = connection;
        connectionShouldBeClosed = false;
    }


    public JdbcItemDao(Connection connection, boolean connectionShouldBeClosed) {
        this.connection = connection;
        this.connectionShouldBeClosed = connectionShouldBeClosed;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Item> getAll() {
        List<Item> items = new ArrayList<>();
        try(Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_ALL)) {
            while (resultSet.next())
                items.add(getItemFromResultSet(resultSet));

        } catch (SQLException e) {
            System.out.println("EXCEPTION: " + e);
        }

        return items;
    }

    @Override
    public Optional<Item> getById(Integer id) {
        return Optional.empty();
    }

    @Override
    public void create(Item item) {
        try (PreparedStatement query = connection.prepareStatement(CREATE, Statement.RETURN_GENERATED_KEYS)) {
            query.setInt(1, item.getCategory().getId());
            query.setString(2, item.getName());
            query.setBigDecimal(3, item.getPrice());
            query.setString(4, item.getDescription());
            query.setInt(5, item.getAmount());
            query.setInt(6, item.getAge());
            query.setBytes(7, item.readFile());

            query.executeUpdate();

            ResultSet keys = query.getGeneratedKeys();
            if (keys.next())
                item.setId(keys.getInt(1));

        } catch (SQLException e) {
//            LOGGER.error("JdbcCategoryDao create error" + category, e);
//            throw new ServerException(e);
            System.out.println("ERROR: " + e);
        }
    }

    @Override
    public void update(Item item) {

    }

    @Override
    public void delete(Integer id) {

    }

    @Override
    public void close() {
        if (connectionShouldBeClosed) {
            try {
                connection.close();
            } catch (SQLException e) {
                //LOGGER.error("JdbcItemDao close error", e);
                //throw new ServerException(e);
            }
        }
    }

    protected static Item getItemFromResultSet(ResultSet resultSet) throws SQLException {
        // TODO: finish
        return new Item.Builder()
                .setId(resultSet.getInt(ID)).build();
    }
}

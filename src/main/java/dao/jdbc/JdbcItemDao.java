package dao.jdbc;

import dao.ItemDao;
import entity.Category;
import entity.Item;

import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
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

    private static final String GET_BY_CATEGORY_PRICE_AGE = "SELECT * FROM Item " +
            "INNER JOIN Category USING (id_category) " +
            "WHERE category_name=? AND item_price >=? AND item_price <=? AND age>=? AND age<=?";

    private static final String GET_BY_CATEGORY = "SELECT * FROM Item " +
            "INNER JOIN Category USING(id_category) " +
            "WHERE category_name=?";

    private static final String GET_BY_PRICE = "SELECT * FROM Item " +
            "INNER JOIN Category USING (id_category) " +
            "WHERE item_price >=? AND item_price <=?";

    private static final String GET_BY_AGE = "SELECT * FROM Item " +
            "INNER JOIN Category USING (id_category) " +
            "WHERE age>=? AND age<=?";

    private static final String SEARCH_BY_NAME_OR_ID = "SELECT * FROM Item " +
            "INNER JOIN Category USING (id_category) " +
            "WHERE LOWER(item_name) LIKE CONCAT('%', LOWER(?), '%') " +
            "OR id_item LIKE CONCAT('%', ?, '%')";

    private static final String CREATE_IMAGES = "INSERT INTO Item_Image(id_item, image) VALUES(?, ?)";

    private static final String GET_IMAGES_BY_ITEM_ID = "SELECT * FROM Item_Image WHERE id_item=?";
    private final static String GET_ALL = "SELECT * FROM Item INNER JOIN Category USING (id_category)";
    private final static String GET_BY_ID = "SELECT * FROM Item INNER JOIN Category USING(id_category) WHERE id_item=?";
    private final static String CREATE = "INSERT INTO Item (id_category, item_name, item_price, description, amount, age) " +
            "VALUES (?, ?, ?, ?, ?, ?)";
    private final static String UPDATE =  "UPDATE Item SET id_category=?, item_name=?, item_price=?, description=?, " +
            "amount=?, age=? WHERE id_item=?";
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
    public List<Item> filterItemsByCategoryByPriceByAge(List<Category> categories, BigDecimal minPrice, BigDecimal maxPrice, int minAge,
                                                        int maxAge) {
        List<Item> items = new ArrayList<>();

        for(Category currentCategory : categories) {
            try (PreparedStatement statement = connection.prepareStatement(GET_BY_CATEGORY_PRICE_AGE)) {
                statement.setString(1, currentCategory.getName());
                statement.setBigDecimal(2, minPrice);
                statement.setBigDecimal(3, maxPrice);
                statement.setInt(4, minAge);
                statement.setInt(5, maxAge);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Item currentItem = getItemFromResultSet(resultSet);
                    currentItem.setBase64Images(getBase64ImagesByItemId(currentItem.getId()));
                    items.add(currentItem);
                }

            } catch (SQLException | IOException e) {
                e.printStackTrace();
            }
        }

        return items;
    }


    @Override
    public  List<Item> filterByCategoryName(List<Category> categories) {
        List<Item> items = new ArrayList<>();

        for(Category currentCategory : categories) {
            try(PreparedStatement statement = connection.prepareStatement(GET_BY_CATEGORY)) {
                statement.setString(1, currentCategory.getName());
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Item currentItem = getItemFromResultSet(resultSet);
                    currentItem.setBase64Images(getBase64ImagesByItemId(currentItem.getId()));
                    items.add(currentItem);
                }

            } catch (SQLException | IOException e) {
                e.printStackTrace();
            }
        }

        return items;
    }

    @Override
    public List<Item> filterByPrice(BigDecimal minPrice, BigDecimal maxPrice) {
        List<Item> items = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(GET_BY_PRICE)) {
            statement.setBigDecimal(1, minPrice);
            statement.setBigDecimal(2, maxPrice);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Item currentItem = getItemFromResultSet(resultSet);
                currentItem.setBase64Images(getBase64ImagesByItemId(currentItem.getId()));
                items.add(currentItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return items;
    }

    @Override
    public List<Item> filterByAge(int minAge, int maxAge) {
        List<Item> items = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(GET_BY_AGE)) {
            statement.setInt(1, minAge);
            statement.setInt(2, maxAge);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Item currentItem = getItemFromResultSet(resultSet);
                currentItem.setBase64Images(getBase64ImagesByItemId(currentItem.getId()));
                items.add(currentItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return items;
    }

    @Override
    public List<Item> searchByItemNameOrId(String nameOrId) {
        List<Item> items = new ArrayList<>();
        try(PreparedStatement statement = connection.prepareStatement(SEARCH_BY_NAME_OR_ID)) {
            statement.setString(1, nameOrId);
            statement.setString(2, nameOrId);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Item currentItem = getItemFromResultSet(resultSet);
                currentItem.setBase64Images(getBase64ImagesByItemId(currentItem.getId()));
                items.add(currentItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return items;
    }

    @Override
    public List<Item> getAll() {
        List<Item> items = new ArrayList<>();
        try(Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_ALL)) {
            while (resultSet.next()) {
                Item currentItem = getItemFromResultSet(resultSet);
                currentItem.setBase64Images(getBase64ImagesByItemId(currentItem.getId()));
                items.add(currentItem);
            }

        } catch (SQLException e) {
            System.out.println("EXCEPTION: " + e);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        return items;
    }

    @Override
    public Optional<Item> getById(Integer id) {
        Optional<Item> item = Optional.empty();
        try (PreparedStatement statement = connection.prepareStatement(GET_BY_ID)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next())
                item = Optional.of(getItemFromResultSet(resultSet));

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        item.ifPresent(value -> value.setBase64Images(getBase64ImagesByItemId(id)));
        return item;
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

            query.executeUpdate();

            ResultSet keys = query.getGeneratedKeys();
            if (keys.next())
                item.setId(keys.getInt(1));

        } catch (SQLException e) {
//            LOGGER.error("JdbcCategoryDao create error" + category, e);
//            throw new ServerException(e);
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    @Override
    public void saveImages(Item item) {
        List<Part> parts = item.getParts();

        try(PreparedStatement statement = connection.prepareStatement(CREATE_IMAGES, Statement.RETURN_GENERATED_KEYS)) {
            for(Part part : parts) {
                statement.setInt(1, item.getId());

                InputStream fileContent = part.getInputStream();
                byte[] imageBytes = readBytesFromInputStream(fileContent);

                statement.setBytes(2, imageBytes);
                statement.addBatch();
            }
            statement.executeBatch();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    public List<String> getBase64ImagesByItemId(Integer itemId) {
        List<String> images = new ArrayList<>();

        try(PreparedStatement query = connection.prepareStatement(GET_IMAGES_BY_ITEM_ID)) {
            query.setInt(1, itemId);
            ResultSet resultSet = query.executeQuery();
            while (resultSet.next())
                images.add(getBase64ImageFromResultSet(resultSet));

        } catch (SQLException |IOException e) {
            e.printStackTrace();
        }

        return images;
    }


    private byte[] readBytesFromInputStream(InputStream inputStream) throws Exception {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[16384];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }

    @Override
    public void update(Item item) {
        try(PreparedStatement statement = connection.prepareStatement(UPDATE)) {
            statement.setInt(1, item.getCategory().getId());
            statement.setString(2, item.getName());
            statement.setBigDecimal(3, item.getPrice());
            statement.setString(4, item.getDescription());
            statement.setInt(5, item.getAmount());
            statement.setInt(6, item.getAge());

            statement.setInt(7, item.getId());

            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer id) {
        try (PreparedStatement statement = connection.prepareStatement(DELETE)) {
            statement.setInt(1, id);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void close() {
        if (connectionShouldBeClosed) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                //LOGGER.error("JdbcItemDao close error", e);
                //throw new ServerException(e);
            }
        }
    }

    protected static Item getItemFromResultSet(ResultSet resultSet) throws SQLException, IOException {
        return new Item.Builder()
                .setId(resultSet.getInt(ID))
                .setCategory(JdbcCategoryDao.getCategoryFromResultSet(resultSet))
                .setName(resultSet.getString(NAME))
                .setPrice(resultSet.getBigDecimal(PRICE))
                .setDescription(resultSet.getString(DESCRIPTION))
                .setAmount(resultSet.getInt(AMOUNT))
                .setAge(resultSet.getInt(AGE))
                .build();
    }

    protected static String getBase64ImageFromResultSet(ResultSet resultSet) throws SQLException, IOException {
        InputStream is = resultSet.getBinaryStream(IMAGE);

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;

        while ((bytesRead = is.read(buffer)) != -1)
            outputStream.write(buffer, 0, bytesRead);


        byte[] imageBytes = outputStream.toByteArray();
        return Base64.getEncoder().encodeToString(imageBytes);
    }

}

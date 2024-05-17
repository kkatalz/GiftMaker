package dao.jdbc;

import dao.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.SQLException;

public class JdbcDaoFactory extends DaoFactory {

    private DataSource dataSource;

    public JdbcDaoFactory() {
        try {
            InitialContext ic = new InitialContext();
            dataSource = (DataSource) ic.lookup("java:comp/env/jdbc/GiftMaker");
        } catch (Exception e) {
            e.printStackTrace();
            /*LOGGER.error("JdbcDaoFactory constructor  error", e);
            throw new ServerException(e);*/
        }
    }

    @Override
    public DaoConnection getConnection() {
        try {
            return new JdbcDaoConnection(dataSource.getConnection());
        } catch (SQLException e) {
            e.printStackTrace();
            //LOGGER.error("JdbcDaoFactory getConnection  error", e);
            return null;
        }
    }

    @Override
    public CategoryDao createCategoryDao() {
        try {
            return new JdbcCategoryDao(dataSource.getConnection(), true);
        } catch (SQLException e) {
            e.printStackTrace();
            //LOGGER.error("JdbcDaoFactory createCategoryDao  error", e);
            return null;
        }
    }

    @Override
    public ItemDao createItemDao() {
        try {
            return new JdbcItemDao(dataSource.getConnection(), true);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public PossibleItemDao createPossibleItemDao() {
        // TODO: implement
        return null;
    }

    @Override
    public UserDao createUserDao() {
        try {
            return new JdbcUserDao(dataSource.getConnection(), true);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public JdbcItemInCartDao createItemInCartDao() {
        try {
            return new JdbcItemInCartDao(dataSource.getConnection(), true);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public JdbcLikedItemDao createLikedItemDao() {
        try {
            return new JdbcLikedItemDao(dataSource.getConnection(), true);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}

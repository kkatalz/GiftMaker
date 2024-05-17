package dao;

import dao.jdbc.JdbcItemInCartDao;
import dao.jdbc.JdbcLikedItemDao;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.Properties;

public abstract class DaoFactory {
    public static final String DB_FILE = "/db.properties";
    private static final String DB_FACTORY_CLASS = "factory.class";

    private static DaoFactory daoFactory;
    public abstract DaoConnection getConnection();

    public abstract CategoryDao createCategoryDao();
    public abstract ItemDao createItemDao();
    public abstract PossibleItemDao createPossibleItemDao();
    public abstract UserDao createUserDao();
    public abstract JdbcItemInCartDao createItemInCartDao();
    public abstract JdbcLikedItemDao createLikedItemDao();


    public static DaoFactory getDaoFactory() {
        if(daoFactory == null) {
            try {
                InputStream inputStream = DaoFactory.class.getResourceAsStream(DB_FILE);
                Properties dbProps = new Properties();
                dbProps.load(inputStream);
                String factoryClass = dbProps.getProperty(DB_FACTORY_CLASS);
                daoFactory = (DaoFactory) Class.forName(factoryClass).getDeclaredConstructor().newInstance();

            } catch (IOException | IllegalAccessException | InstantiationException | ClassNotFoundException |
                     NoSuchMethodException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                throw new RuntimeException(e);
            }
        }
        return daoFactory;
    }
}

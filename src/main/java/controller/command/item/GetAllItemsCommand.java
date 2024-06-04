package controller.command.item;

import dao.DaoFactory;
import entity.Category;
import entity.Item;
import entity.LikedItem;
import entity.User;
import service.CategoryService;
import service.ItemService;
import service.LikedItemService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/allItems")
public class GetAllItemsCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User currentUser = (User) session.getAttribute("currentUser");
        int idUser = currentUser.getId();

        ItemService itemService = new ItemService(DaoFactory.getDaoFactory());
        CategoryService categoryService = new CategoryService(DaoFactory.getDaoFactory());
        LikedItemService likedItemService = new LikedItemService(DaoFactory.getDaoFactory());
        List<Item> items = itemService.getAllItems();
        List<Category> categories = categoryService.getAllCategories();
        List<LikedItem> likedItems = likedItemService.getLikedItemsByUserId(idUser);

        session.setAttribute("items", items);
        session.setAttribute("categories", categories);
        session.setAttribute("likedItems", likedItems);

        String jspPage = "/WEB-INF/views/allItems.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String search = request.getParameter("search");
        String fromPriceStr = request.getParameter("fromPrice");
        String toPriceStr = request.getParameter("toPrice");
        String[] categoryIds = request.getParameterValues("categoryIds");
        String fromAgeStr = request.getParameter("fromDate");
        String toAgeStr = request.getParameter("toDate");


        ItemService itemService = new ItemService(DaoFactory.getDaoFactory());
        CategoryService categoryService = new CategoryService(DaoFactory.getDaoFactory());
        List<Item> items = new ArrayList<>();

        // Filter items based on search parameters
        if (search != null && !search.isEmpty()) {
            items = itemService.searchItemByNameOrId(search);
        }

        BigDecimal fromPrice = fromPriceStr.isEmpty() ? null : new BigDecimal(fromPriceStr);
        BigDecimal toPrice = toPriceStr.isEmpty() ? null : new BigDecimal(toPriceStr);
        Integer fromAge = fromAgeStr.isEmpty() ? 0 : Integer.parseInt(fromAgeStr);
        Integer toAge = toAgeStr.isEmpty() ? Integer.MAX_VALUE : Integer.parseInt(toAgeStr);

        List<Category> selectedCategories = new ArrayList<>();
        if (categoryIds != null) {
            for (String categoryId : categoryIds) {
                Integer id = Integer.parseInt(categoryId);
                Optional<Category> categoryOpt = categoryService.getCategoryById(id);
                categoryOpt.ifPresent(selectedCategories::add);
            }
        }

        // do not filter if there is no filter values

        if (!(selectedCategories.isEmpty() && fromPrice == null && toPrice == null
                && fromAge == 0 && toAge == Integer.MAX_VALUE)) {
            items = itemService.filterItems(selectedCategories, fromPrice, toPrice, fromAge, toAge);

        }

        HttpSession session = request.getSession();
        session.setAttribute("items", items);


        User currentUser = (User) session.getAttribute("currentUser");
        int idUser = currentUser.getId();

        LikedItemService likedItemService = new LikedItemService(DaoFactory.getDaoFactory());
        List<LikedItem> likedItems = likedItemService.getLikedItemsByUserId(idUser);
        session.setAttribute("likedItems", likedItems);

        String jspPage = "/WEB-INF/views/allItems.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }


}
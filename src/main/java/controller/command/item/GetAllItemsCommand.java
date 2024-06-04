package controller.command.item;

import dao.DaoFactory;
import entity.Category;
import entity.Item;
import service.CategoryService;
import service.ItemService;

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
        ItemService itemService = new ItemService(DaoFactory.getDaoFactory());
        CategoryService categoryService = new CategoryService(DaoFactory.getDaoFactory());
        List<Item> items = itemService.getAllItems();
        List<Category> categories = categoryService.getAllCategories();

        HttpSession session = request.getSession();
        session.setAttribute("items", items);
        session.setAttribute("categories", categories);


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

        BigDecimal fromPrice = fromPriceStr.isEmpty() ? BigDecimal.ZERO : new BigDecimal(fromPriceStr);
        BigDecimal toPrice = toPriceStr.isEmpty() ? BigDecimal.valueOf(Double.MAX_VALUE) : new BigDecimal(toPriceStr);
        int fromAge = fromAgeStr.isEmpty() ? 0 : Integer.parseInt(fromAgeStr);
        int toAge = toAgeStr.isEmpty() ? Integer.MAX_VALUE : Integer.parseInt(toAgeStr);

        List<Category> selectedCategories = new ArrayList<>();

        System.out.println(categoryIds);
        if (categoryIds != null) {
            for (String categoryId : categoryIds) {
                Integer id = Integer.parseInt(categoryId);
                Optional<Category> categoryOpt = categoryService.getCategoryById(id);
                categoryOpt.ifPresent(selectedCategories::add);
            }
        }

        System.out.println(selectedCategories);

        // do not filter if there is not filter values
        if (!(selectedCategories.isEmpty() && fromPrice.equals(BigDecimal.ZERO) && toPrice.equals(BigDecimal.valueOf(Double.MAX_VALUE))
                && fromAge == 0 && toAge == Integer.MAX_VALUE)) {
            items = itemService.filterItems(selectedCategories, fromPrice, toPrice, fromAge, toAge);

        }

        HttpSession session = request.getSession();
        session.setAttribute("items", items);

        String jspPage = "/WEB-INF/views/allItems.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }


}

package controller.command.item;

import dao.DaoFactory;
import entity.*;
import service.CategoryService;
import service.ItemInCartService;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            HttpSession session = request.getSession();

            User currentUser = (User) session.getAttribute("currentUser");
            if(currentUser == null) {
                String jspPage = "/login";
                String redirectURL = request.getContextPath() + jspPage;
                response.sendRedirect(redirectURL);
                return;
            }


            int idUser = currentUser.getId();

            ItemService itemService = ItemService.getInstance();
            CategoryService categoryService = CategoryService.getInstance();
            LikedItemService likedItemService = LikedItemService.getInstance();
            ItemInCartService itemInCartService = ItemInCartService.getInstance();
            List<Item> items = itemService.getAllItems();
            List<Category> categories = categoryService.getAllCategories();
            List<LikedItem> likedItems = likedItemService.getLikedItemsByUserId(idUser);
            List<ItemInCart> itemsInCart = itemInCartService.getItemsInCartByUserId(idUser);
            String categoryIdStr = request.getParameter("category");
            List<Category> selectedCategories = new ArrayList<>();


            if(categoryIdStr != null && !categoryIdStr.isEmpty()){
                Integer id = Integer.parseInt(categoryIdStr);
                Optional<Category> categoryOpt = categoryService.getCategoryById(id);
                categoryOpt.ifPresent(selectedCategories::add);
            }
            if (!(selectedCategories.isEmpty())) {
                System.out.println("Selected categories: " + selectedCategories);
                items = itemService.filterItems(selectedCategories, null, null, 0, Integer.MAX_VALUE);
            }
            session.setAttribute("items", items);
            session.setAttribute("categories", categories);
            session.setAttribute("likedItems", likedItems);
            session.setAttribute("itemsInCart", itemsInCart);

            String jspPage = "/WEB-INF/views/allItems.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
            dispatcher.forward(request, response);
        } catch (Exception e) {
            System.out.println("Error in GetAllItemsCommand: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String search = request.getParameter("search") != null ? request.getParameter("search") : "";
        String fromPriceStr = request.getParameter("fromPrice") != null ? request.getParameter("fromPrice") : "";
        String toPriceStr = request.getParameter("toPrice") != null ? request.getParameter("toPrice") : "";
        String[] categoryIds = request.getParameterValues("categoryIds") != null ? request.getParameterValues("categoryIds") : new String[]{};
        String fromAgeStr = request.getParameter("fromDate") != null ? request.getParameter("fromDate") : "";
        String toAgeStr = request.getParameter("toDate") != null ? request.getParameter("toDate") : "";

        ItemService itemService = ItemService.getInstance();
        CategoryService categoryService = CategoryService.getInstance();
        List<Item> items = new ArrayList<>();

        // Filter items based on search parameters
        if (search != null && !search.isEmpty()) {
            items = itemService.searchItemByNameOrId(search);
        }

        BigDecimal fromPrice = fromPriceStr.isEmpty() ? BigDecimal.valueOf(0) : new BigDecimal(fromPriceStr);
        BigDecimal toPrice = toPriceStr.isEmpty() ? BigDecimal.valueOf(Double.MAX_VALUE) : new BigDecimal(toPriceStr);
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

        if (!(selectedCategories.isEmpty() && fromPrice.equals(BigDecimal.valueOf(0)) && toPrice.equals(BigDecimal.valueOf(Double.MAX_VALUE))
                && fromAge == 0 && toAge == Integer.MAX_VALUE)) {
            items = itemService.filterItems(selectedCategories, fromPrice, toPrice, fromAge, toAge);

        }

        HttpSession session = request.getSession();
        session.setAttribute("items", items);

        User currentUser = (User) session.getAttribute("currentUser");
        int idUser = currentUser.getId();

        LikedItemService likedItemService = LikedItemService.getInstance();
        List<LikedItem> likedItems = likedItemService.getLikedItemsByUserId(idUser);
        session.setAttribute("likedItems", likedItems);

        List<Category> categories = categoryService.getAllCategories();
        session.setAttribute("categories", categories);

        ItemInCartService itemInCartService = ItemInCartService.getInstance();
        List<ItemInCart> itemsInCart = null;
        try {
            itemsInCart = itemInCartService.getItemsInCartByUserId(idUser);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        session.setAttribute("itemsInCart", itemsInCart);

        String jspPage = "/WEB-INF/views/allItems.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }

}
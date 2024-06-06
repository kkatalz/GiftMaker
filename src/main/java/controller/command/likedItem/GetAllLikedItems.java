package controller.command.likedItem;

import dao.DaoFactory;
import entity.Item;
import entity.ItemInCart;
import entity.LikedItem;
import entity.User;
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
import java.util.ArrayList;
import java.util.List;

/**
 * To redirect user to the page with all their liked items.
 */

@WebServlet("/likedItems")
public class GetAllLikedItems extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {

        HttpSession session = request.getSession(false);

        if(session != null) {
            List<LikedItem> items = new ArrayList<>();
            List<ItemInCart> itemsInCart = new ArrayList<>();
            User user = (User) session.getAttribute("currentUser");
            LikedItemService likedItemService = LikedItemService.getInstance();
            ItemInCartService itemInCartService = ItemInCartService.getInstance();
            if(user != null){
                items = likedItemService.getLikedItemsByUserId(user.getId());
                try {
                    itemsInCart = itemInCartService.getItemsInCartByUserId(user.getId());
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }


            session.setAttribute("likedItems", items);
            session.setAttribute("itemsInCart", itemsInCart);

        }

        String jspPage = "/WEB-INF/views/wishlist.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}

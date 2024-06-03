package controller.command.likedItem;

import dao.DaoFactory;
import entity.Item;
import entity.LikedItem;
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
import java.util.List;

/**
 * To redirect user to the page with all their liked items.
 */

@WebServlet("/likedItems")
public class GetAllLikedItems extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LikedItemService likedItemService = new LikedItemService(DaoFactory.getDaoFactory());
        List<LikedItem> items = likedItemService.getLikedItemsByUserId(1);

        HttpSession session = request.getSession();
        session.setAttribute("likedItems", items);

        System.out.println(items);

        String jspPage = "/WEB-INF/views/wishlist.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }
}

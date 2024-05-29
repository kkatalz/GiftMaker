package controller.command.likedItem;

import entity.LikedItem;
import entity.User;
import service.LikedItemService;

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if(session != null) {
            User currentUser = (User) session.getAttribute("currentUser");
            List<LikedItem> likedItems = LikedItemService.getInstance().getLikedItemsByUserId(currentUser.getId());

            session.setAttribute("likedItems", likedItems);
            // TODO: add path to show liked items
            String jspPage = "/";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);
        }
    }
}

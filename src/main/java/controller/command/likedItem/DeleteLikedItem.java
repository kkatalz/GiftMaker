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
 * To delete the liked item from the user's list of liked items.
 */

@WebServlet("/deleteLikedItem")
public class DeleteLikedItem extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            int idItem = Integer.parseInt(request.getParameter("idItem"));
            User currentUser = (User) session.getAttribute("currentUser");
            int idUser = currentUser.getId();

            LikedItemService.getInstance().deleteLikedItem(idUser, idItem);
            List<LikedItem> likedItems = LikedItemService.getInstance().getLikedItemsByUserId(idUser);
            session.setAttribute("likedItems", likedItems);

            // TODO: add path after deleting item from the liked items
            String jspPage = "/";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);
        }
    }
}
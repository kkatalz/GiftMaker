package controller.command.likedItem;

import entity.Item;
import entity.LikedItem;
import entity.User;
import service.LikedItemService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/addLikedItem")
public class PostAddLikedItem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        String jspPage;

        if (session == null || session.getAttribute("currentUser") == null) {
            jspPage = "/login";
        } else {
            jspPage = "/home";
        }

        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String jspPage;
        if (session == null) {
            jspPage = "/WEB-INF/views/login.jsp";
        } else {
            User currentUser = (User) session.getAttribute("currentUser");
            if (currentUser == null || currentUser.getRole().getValue().equals("administrator")) {
                jspPage = "/WEB-INF/views/login.jsp";
            } else {
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                LikedItemService likedItemService = LikedItemService.getInstance();

                // Check if this item is already in the user's wishlist
                Optional<LikedItem> itemAlreadyInTheList = likedItemService.getById(currentUser.getId(), itemId);
                if (itemAlreadyInTheList.isPresent()) {
                    likedItemService.deleteLikedItem(currentUser.getId(), itemId);
                } else {
                    LikedItem likedItemToAdd = new LikedItem.Builder()
                            .setItem(new Item.Builder().setId(itemId).build())
                            .setUser(currentUser)
                            .build();
                    likedItemService.createLikedItem(likedItemToAdd);
                }
                jspPage = "/WEB-INF/views/allItems.jsp";
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }
}

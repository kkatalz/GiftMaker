package controller.command.itemInCart;

import entity.ItemInCart;
import entity.User;
import service.ItemInCartService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Get all items in cart of current user.
 */

@WebServlet("/itemsInCart")
public class GetAllItemsInCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if(session != null) {
            User currentUser = (User) session.getAttribute("currentUser");
            List<ItemInCart> itemsInCart;
            try {
                itemsInCart = ItemInCartService.getInstance().getItemsInCartByUserId(currentUser.getId());
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }

            session.setAttribute("itemsInCart", itemsInCart);
            // TODO: add path to show itemsInCart
            String jspPage = "/";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);
        }
    }
}

package controller.command.itemInCart;

import entity.User;
import service.ItemInCartService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * To delete item from user's cart.
 */

@WebServlet("/deleteItemFromCart")
public class DeleteItemInCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if(session != null) {
            int idItem = Integer.parseInt(request.getParameter("idItem"));
            User currentUser = (User) session.getAttribute("currentUser");
            int idUser = currentUser.getId();

            try {
                ItemInCartService.getInstance().deleteItemInCart(idUser, idItem);
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }

            // TODO: add path after deleting item from the cart
            String jspPage = "/";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);

        }
    }

}

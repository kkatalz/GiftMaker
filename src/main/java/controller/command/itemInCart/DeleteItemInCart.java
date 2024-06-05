package controller.command.itemInCart;

import entity.ItemInCart;
import entity.User;
import service.ItemInCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * To delete item from user's cart.
 */

@WebServlet("/deleteItemFromCart")
public class DeleteItemInCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if(session != null) {
            int idItem = Integer.parseInt(request.getParameter("idItem"));
            User currentUser = (User) session.getAttribute("currentUser");
            int idUser = currentUser.getId();

            try {
                ItemInCartService.getInstance().deleteItemInCart(idUser, idItem);
                List<ItemInCart> itemsInCart = ItemInCartService.getInstance().getItemsInCartByUserId(idUser);
                session.setAttribute("itemsInCart", itemsInCart);

                double grandTotal = calculateGrandTotal(itemsInCart);

                response.setContentType("application/json");
                response.getWriter().write("{\"success\": true, \"grandTotal\": " + grandTotal + "}");
            } catch (Exception e) {
                e.printStackTrace();
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": false}");
            }
        }
    }

    private double calculateGrandTotal(List<ItemInCart> itemsInCart) {
        double grandTotal = 0;
        for (ItemInCart itemInCart : itemsInCart) {
            grandTotal += itemInCart.getItem().getPrice().doubleValue() * itemInCart.getAmount();
        }
        return grandTotal;
    }
}

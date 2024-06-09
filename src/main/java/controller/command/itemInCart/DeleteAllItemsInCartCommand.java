package controller.command.itemInCart;

import entity.ItemInCart;
import entity.User;
import service.ItemInCartService;

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
 * To delete all items from user's cart.
 */

@WebServlet("/deleteAllItemsFromCart")
public class DeleteAllItemsInCartCommand extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if(session != null) {
            User currentUser = (User) session.getAttribute("currentUser");
            int idUser = currentUser.getId();

            try {
                ItemInCartService.getInstance().deleteAllItemsInCartByUserId(idUser);
                List<ItemInCart> itemsInCart = ItemInCartService.getInstance().getItemsInCartByUserId(idUser);
                session.setAttribute("itemsInCart", itemsInCart);

                double grandTotal = 0;

                response.setContentType("application/json");
                response.getWriter().write("{\"success\": true, \"grandTotal\": " + grandTotal + "}");
            } catch (Exception e) {
                e.printStackTrace();
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": false}");
            }

            String jspPage = "/WEB-INF/views/basket.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
            dispatcher.forward(request, response);
        }
    }
}

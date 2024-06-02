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


/**
 * Get all items in cart of current user.
 */

@WebServlet("/itemsInCart")
public class GetAllItemsInCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        HttpSession session = request.getSession(false);
//        if(session != null) {
//            User currentUser = (User) session.getAttribute("currentUser");
//            List<ItemInCart> itemsInCart;
//            try {
//                itemsInCart = ItemInCartService.getInstance().getItemsInCartByUserId(currentUser.getId());
//            } catch (Exception e) {
//                e.printStackTrace();
//                throw new RuntimeException(e);
//            }
//
//            session.setAttribute("itemsInCart", itemsInCart);
//            String jspPage = "/WEB-INF/views/basket.jsp";
//            String redirectURL = request.getContextPath() + jspPage;
//            response.sendRedirect(redirectURL);
//        }


        String jspPage = "/WEB-INF/views/basket.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }
}

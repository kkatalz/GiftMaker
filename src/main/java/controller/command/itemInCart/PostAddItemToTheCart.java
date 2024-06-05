package controller.command.itemInCart;


import dto.ItemInCartDto;
import entity.Item;
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
import java.util.Optional;

/**
 * To add item to the user's cart.
 */

@WebServlet("/addItemToCart")
public class PostAddItemToTheCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String jspPage;
        if(session == null) {
            jspPage = "/WEB-INF/views/login.jsp";
        }

        else {
            User user = (User) session.getAttribute("currentUser");
            if(user != null && user.getRole().getValue().equals("client")) {
                int itemId = Integer.parseInt(request.getParameter("itemId"));

                try {
                    Optional<ItemInCart> isInTheCart = ItemInCartService.getInstance().getById(user.getId(), itemId);

                    if(isInTheCart.isPresent()) { // item already in the cart, update its amount in the cart
                       updateItemInCart(isInTheCart.get(), user);

                    } else {
                        createItemInCart(itemId, user);
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                    throw new RuntimeException(e);
                }

                jspPage = "/WEB-INF/views/itemsInCart.jsp";

                try {
                    session.setAttribute("itemsInCart", ItemInCartService.getInstance().getItemsInCartByUserId(user.getId()));
                } catch (Exception e) {
                    e.printStackTrace();
                    throw new RuntimeException(e);
                }
            }

            else
                jspPage = "/WEB-INF/views/allItems.jsp";

        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }

    private void updateItemInCart(ItemInCart itemInCart, User user) throws Exception {
        ItemInCartDto itemInCartDto = new ItemInCartDto.Builder()
                .setItem(itemInCart.getItem())
                .setUser(user)
                .setAmount(String.valueOf(itemInCart.getAmount() + 1))
                .build();
        // update in the database
        ItemInCartService.getInstance().updateItemInCart(itemInCartDto);
    }


    private void createItemInCart(int itemId, User user) throws Exception {
        ItemInCartDto itemInCartDto = new ItemInCartDto.Builder()
                .setItem(new Item.Builder().setId(itemId).build())
                .setUser(user)
                .setAmount("1")
                .build();

        ItemInCartService.getInstance().createItemInCart(itemInCartDto);
    }
}

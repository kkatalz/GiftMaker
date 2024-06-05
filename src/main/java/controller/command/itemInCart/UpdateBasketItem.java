package controller.command.itemInCart;

import dto.ItemInCartDto;
import entity.Item;
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
import java.util.Optional;

@WebServlet("/updateBasketItem")
public class UpdateBasketItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User currentUser = (User) session.getAttribute("currentUser");
            int itemId = Integer.parseInt(request.getParameter("itemId"));

            try {
                Optional<ItemInCart> itemInCartOptional = ItemInCartService.getInstance().getById(currentUser.getId(), itemId);
                if (itemInCartOptional.isPresent()) {
                    ItemInCartService.getInstance().deleteItemInCart(currentUser.getId(), itemId);
                } else {
                    ItemInCartDto itemInCart = new ItemInCartDto.Builder()
                            .setUser(currentUser)
                            .setItem(new Item.Builder().setId(itemId).build())
                            .setAmount("1")
                            .build();
                    ItemInCartService.getInstance().createItemInCart(itemInCart);
                }

                List<ItemInCart> itemsInCart = ItemInCartService.getInstance().getItemsInCartByUserId(currentUser.getId());
                session.setAttribute("itemsInCart", itemsInCart);

                response.setContentType("application/json");
                response.getWriter().write("{\"success\": true}");
            } catch (Exception e) {
                e.printStackTrace();
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": false}");
            }
        }
    }
}

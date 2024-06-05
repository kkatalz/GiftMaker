package controller.command.itemInCart;

import dto.ItemDto;
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
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@WebServlet("/updateItemQuantity")
public class UpdateItemQuantityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User currentUser = (User) session.getAttribute("currentUser");
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int delta = Integer.parseInt(request.getParameter("delta"));

            try {
                Optional<ItemInCart> itemInCartOptional = ItemInCartService.getInstance().getById(currentUser.getId(), itemId);
                if (itemInCartOptional.isPresent()) {
                    ItemInCart itemInCart = itemInCartOptional.get();
                    int newQuantity = itemInCart.getAmount() + delta;
                    if (newQuantity > 0) {
                        Item itemDto = new Item.Builder()
                                .setId(itemInCart.getItem().getId())
                                .setName(itemInCart.getItem().getName())
                                .setPrice(itemInCart.getItem().getPrice())
                                .setBase64Image(itemInCart.getItem().getBase64Images())
                                .build();

                        ItemInCartDto itemInCartDto = new ItemInCartDto.Builder()
                                .setItem(itemDto)
                                .setUser(currentUser)
                                .setAmount(String.valueOf(newQuantity))
                                .build();

                        ItemInCartService.getInstance().updateItemInCart(itemInCartDto);
                        session.setAttribute("itemsInCart", ItemInCartService.getInstance().getItemsInCartByUserId(currentUser.getId()));

                        double grandTotal = calculateGrandTotal((List<ItemInCart>) session.getAttribute("itemsInCart"));
                        double itemTotalPrice = itemInCart.getItem().getPrice().doubleValue() * newQuantity;

                        response.setContentType("application/json");
                        response.getWriter().write("{\"success\": true, \"newQuantity\": " + newQuantity + ", \"itemTotalPrice\": " + itemTotalPrice + ", \"grandTotal\": " + grandTotal + "}");
                    } else {
                        response.setContentType("application/json");
                        response.getWriter().write("{\"success\": false}");
                    }
                } else {
                    response.setContentType("application/json");
                    response.getWriter().write("{\"success\": false}");
                }
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException(e);
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

package controller.command.item;

import entity.Item;
import service.ItemService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

/**
 * Get all information about item by its ID.
 */

@WebServlet("/itemInfo")
public class GetItemByID extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        int itemID = Integer.parseInt(request.getParameter("itemId"));
        Optional<Item> item = ItemService.getInstance().getById(itemID);

        item.ifPresent(value -> session.setAttribute("item", value));
        // TODO: add path to show item's page
        String jspPage = "";
        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);
    }
}

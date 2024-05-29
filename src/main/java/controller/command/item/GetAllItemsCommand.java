package controller.command.item;

import entity.Item;
import service.ItemService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/allItems")
public class GetAllItemsCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Item> items = ItemService.getInstance().getAllItems();
        HttpSession session = request.getSession();

        session.setAttribute("items", items);
        // TODO: add path to show all items
        String jspPage = "/items.jsp";
        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);

    }
}


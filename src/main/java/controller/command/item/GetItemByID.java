package controller.command.item;

import entity.Item;
import entity.User;
import service.ItemService;

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
 * Get all information about item by its ID.
 */

@WebServlet("/itemDetails")
public class GetItemByID extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();


        int itemID = Integer.parseInt(request.getParameter("id_item")==null? "0" : request.getParameter("id_item"));
        System.out.println(" 1 itemID: " + itemID);
        Optional<Item> item = ItemService.getInstance().getById(itemID);
        System.out.println(" 1 item: " + item);
//        item.ifPresent(value -> session.setAttribute("item", value));

        if(item.isPresent()){
            System.out.println(" 2 item: " + item.get());
            session.setAttribute("item", item.get());

        }else{
            System.out.println("not found item");
        }
        String jspPage = "/WEB-INF/views/itemDetails.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }
}

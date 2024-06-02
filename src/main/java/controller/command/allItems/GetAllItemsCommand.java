package controller.command.allItems;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@WebServlet("/items")
public class GetAllItemsCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String jspPage = "/WEB-INF/views/allItems.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }
}
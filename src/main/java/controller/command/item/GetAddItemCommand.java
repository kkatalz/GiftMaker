package controller.command.item;

import service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/admin/addItem")
public class GetAddItemCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: add path
        String jspPage = "";
        request.setAttribute("categories", CategoryService.getInstance().getAllCategories());
        request.getRequestDispatcher(jspPage).forward(request, response);
    }
}

package controller.command.item;

import service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/admin/addItem")
public class GetAddItemCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException {
        HttpSession session = request.getSession();
        session.setAttribute("categories", CategoryService.getInstance().getAllCategories());

        // TODO: add path
        String jspPage = "";
        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);
    }
}

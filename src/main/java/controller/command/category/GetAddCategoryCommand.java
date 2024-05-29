package controller.command.category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * To go to the page for adding new category.
 */

@WebServlet("/admin/addCategory")
public class GetAddCategoryCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: add path
        String jspPage = "";
        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);
    }
}

package controller.command.category;

import entity.Category;
import entity.User;
import locale.Message;
import service.CategoryService;
import validator.entity.CategoryValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * To add new category.
 */

@WebServlet("/administrator/addCategory")
public class PostAddCategoryCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        String jspPage;

        if (session == null || session.getAttribute("currentUser") == null) {
            jspPage = "/login";
        } else {
            jspPage = "/home";
        }

        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Category category = getInput(request);
        List<String> errors = validateInput(category);
        HttpSession session = request.getSession(false);
        String jspPage = "/WEB-INF/views/categories.jsp";

        // success
        if (errors.isEmpty() && session != null) {
            CategoryService.getInstance().createCategory(category);
            session.setAttribute("categories", CategoryService.getInstance().getAllCategories());


            RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
            dispatcher.forward(request, response);
        } else if (!errors.isEmpty() && session != null) {
            // failure scenario
            session.setAttribute("category", category);
            response.sendRedirect(request.getContextPath() + "/administrator/categories?error=" + Message.INVALID_CATEGORY);

        }
    }

    private Category getInput(HttpServletRequest request) {
        return new Category.Builder().setName(request.getParameter("categoryName")).build();
    }

    private List<String> validateInput(Category category) {
        return CategoryValidator.getInstance().validate(category);
    }
}

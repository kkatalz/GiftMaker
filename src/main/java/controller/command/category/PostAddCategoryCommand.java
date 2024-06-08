package controller.command.category;

import entity.Category;
import entity.User;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Category category = getInput(request);
        List<String> errors = validateInput(category);
        HttpSession session = request.getSession(false);
        String jspPage = "/WEB-INF/views/categories.jsp";

        // success
        if (errors.isEmpty() && session != null) {
            CategoryService.getInstance().createCategory(category);
            session.setAttribute("categories", CategoryService.getInstance().getAllCategories());
        } else if (!errors.isEmpty() && session != null) {
            // failure scenario
            session.setAttribute("errors", errors);
            session.setAttribute("category", category);
            jspPage = "/WEB-INF/views/login.jsp";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }

    private Category getInput(HttpServletRequest request) {
        return new Category.Builder().setName(request.getParameter("categoryName")).build();
    }

    private List<String> validateInput(Category category) {
        return CategoryValidator.getInstance().validate(category);
    }
}

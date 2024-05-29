package controller.command.category;

import entity.Category;
import entity.User;
import service.CategoryService;
import validator.entity.CategoryValidator;

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

@WebServlet("/sendNewCategory")
public class PostAddCategoryCommand extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Category category = getInput(request);
        List<String> errors = validateInput(category);
        HttpSession session = request.getSession(false);

        // success
        if (errors.isEmpty() && session != null) {
            CategoryService.getInstance().createCategory(category);
            // TODO: add path to go after successful adding new category
            String jspPage = "";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);

        } else if (!errors.isEmpty() && session != null) {
            // TODO: add path to go after NOT successful adding new category
            // failure scenario
            session.setAttribute("errors", errors);
            session.setAttribute("category", category);

            String jspPage = "";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);
        }
    }

    private Category getInput(HttpServletRequest request) {
        return new Category.Builder().setName(request.getParameter("name")).build();
    }

    private List<String> validateInput(Category category) {
        return CategoryValidator.getInstance().validate(category);
    }
}

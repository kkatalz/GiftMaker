package controller.command.category;

import entity.Category;
import service.CategoryService;
import validator.entity.CategoryValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * To add new category.
 */

@WebServlet("/sendNewCategory")
public class PostAddCategoryCommand extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Category category = getInput(request);
        List<String> errors = validateInput(category);

        // success
        if(errors.isEmpty()) {
            CategoryService.getInstance().createCategory(category);
            // TODO: add path to go after successful adding new category
            String jspPage = "";
            request.getRequestDispatcher(jspPage).forward(request, response);
        }
        else {
            // TODO: add path to go after NOT successful adding new category
            // failure scenario
            String jspPage = "";
            request.setAttribute("errors", errors);
            request.setAttribute("category", category);
            request.getRequestDispatcher(jspPage).forward(request, response);

        }

    }

    private Category getInput(HttpServletRequest request) {
        return new Category.Builder().setName(request.getParameter("name")).build();
    }

    private List<String> validateInput(Category category) {
        return CategoryValidator.getInstance().validate(category);
    }
}

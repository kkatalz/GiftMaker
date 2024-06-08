package controller.command.category;

import entity.Role;
import entity.User;
import service.CategoryService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * To go to the page for adding new category.
 */

@WebServlet("/administrator/categories")
public class GetAddCategoryCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String jspPage = "/WEB-INF/views/categories.jsp";

        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null || currentUser.getRole().getValue().equals(Role.CLIENT)) {
            // unauthorized access
            jspPage = "/WEB-INF/views/login.jsp";
        }else{
            CategoryService categoryService = CategoryService.getInstance();
            session.setAttribute("categories", categoryService.getAllCategories());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }

    }

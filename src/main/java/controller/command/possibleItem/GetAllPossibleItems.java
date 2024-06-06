package controller.command.possibleItem;

import entity.User;
import service.CategoryService;
import service.PossibleItemService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Available only for administrator. Get all possible items from the database.
 */

@WebServlet("/offeredGifts")
public class GetAllPossibleItems extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        String jspPage;
        if(session == null) {
            jspPage = "/WEB-INF/views/login.jsp";


        } else {
            User user = (User) session.getAttribute("currentUser");
            CategoryService categoryService = CategoryService.getInstance();

            if(user != null && user.getRole().getValue().equals("administrator")) {
                session.setAttribute("possibleItems", PossibleItemService.getInstance().getAllPossibleItems());
                session.setAttribute("categories", categoryService.getAllCategories());
                jspPage = "/WEB-INF/views/offeredGifts.jsp";
            }
            else {
                jspPage = "/WEB-INF/views/login.jsp";

            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }
}

package controller.command.possibleItem;

import entity.User;
import service.PossibleItemService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Available only for administrator. Get all possible items from the database.
 */

@WebServlet("/getAllPossibleItems")
public class GetAllPossibleItems extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        String jspPage;
        if(session == null) {
            // TODO: unauthorized access
            jspPage = "";

        } else {
            User user = (User) session.getAttribute("currentUser");

            if(user != null && user.getRole().getValue().equals("administrator")) {
                session.setAttribute("possibleItems", PossibleItemService.getInstance().getAllPossibleItems());
                // TODO: success after getting all possible items, go to the page with all possible items
                jspPage = "";
            }
            else {
                // TODO: unauthorized access
                jspPage = "";
            }
        }

        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);
    }
}

package controller.command.possibleItem;

import entity.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Go to form for adding new possible item.
 */

@WebServlet("/formPossibleItem")
public class GetAddPossibleItem extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException {
        HttpSession session = request.getSession(false);
        String jspPage;
        if(session == null) {
            // unauthorized access
            // TODO: add path to unauthorized access
            jspPage = "";
        }

        // session not null
        else {
            User user = (User) session.getAttribute("currentUser");
            if(user == null || !user.getRole().getValue().equals("client")) {
                // unauthorized access
                // TODO: add path to unauthorized access
                jspPage = "";

            }

            // everything is correct
            else {
                // TODO: path to show the form for adding possible item
                jspPage = "";
            }
        }

        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);
    }
}

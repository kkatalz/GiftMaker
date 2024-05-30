package controller.command.possibleItem;

import entity.User;
import service.PossibleItemService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * When administrator wants to delete (not approve) possible item and not add it to the store.
 */

@WebServlet("/deletePossibleItem")
public class DeletePossibleItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String jspPage;
        if(session == null) {
            // TODO: unauthorized access
            jspPage = "";
        }

        else { // session is not null
            User user = (User) session.getAttribute("currentUser");
            if(user != null && user.getRole().getValue().equals("administrator")) {
                int itemId = Integer.parseInt(request.getParameter("possibleItemId"));
                PossibleItemService.getInstance().delete(itemId);

                session.setAttribute("possibleItems", PossibleItemService.getInstance().getAllPossibleItems());
                // TODO: success after deleting (not approving) possible item
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

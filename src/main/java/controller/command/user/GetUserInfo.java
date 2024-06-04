package controller.command.user;

import entity.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/info")
public class GetUserInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if(session != null) {
            User user = (User) session.getAttribute("currentUser");
            if(user != null) {
                // attribute "currentUser"
                // TODO: add path to show user's info
                String jspPage = "/WEB-INF/views/myProfile.jsp";
                String redirectURL = request.getContextPath() + jspPage;
                response.sendRedirect(redirectURL);
            }
        }

        // TODO: process failure scenario?
    }
}

    package controller.command.auth;

    import entity.User;
    import locale.Message;
    import org.mindrot.jbcrypt.BCrypt;
    import service.UserService;

    import javax.servlet.RequestDispatcher;
    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import javax.servlet.http.HttpSession;
    import java.io.IOException;
    import java.util.Optional;

    /**
     * To login, check username and password. In case of successful logging in, the user will be saved in current
     * session.
     */

    @WebServlet("/login")
    public class PostLoginCommand extends HttpServlet {

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            String jspPage = "/WEB-INF/views/login.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
            dispatcher.forward(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            Optional<User> user = getInput(request);

            System.out.println("user: " + user);

            // successful logging in
            if (user.isPresent()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentUser", user.get());

                String jspPage = "/home";
                String redirectURL = request.getContextPath() + jspPage;
                response.sendRedirect(redirectURL);
            }

            // not successful logging in
            else {

                response.sendRedirect(request.getContextPath() + "/login?error=" + Message.INVALID_USERNAME_OR_PASSWORD);

            }
        }

        private Optional<User> getInput(HttpServletRequest request) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Optional<User> potentialUser = UserService.getInstance().getUserByUsername(username);

            if (potentialUser.isPresent()) {
                if (BCrypt.checkpw(password, potentialUser.get().getEncryptedPassword())) {
                    return potentialUser;
                }
            }
            return Optional.empty();
        }
    }

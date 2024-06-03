package controller.command.auth;

import dao.DaoFactory;
import dto.UserDto;
import entity.Category;
import entity.Role;
import entity.User;
import org.mindrot.jbcrypt.BCrypt;
import service.UserService;
import validator.entity.CategoryValidator;
import validator.entity.UserDtoValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.util.List;
import java.util.Optional;

@WebServlet("/register")
public class GetFormRegistrationCommand extends HttpServlet {

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            String jspPage = "/WEB-INF/views/registration.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
            dispatcher.forward(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            UserDto user = getInput(request);
            List<String> errors = validateUserInput(user);


            if (errors.isEmpty()) {
                UserService userService = new UserService(DaoFactory.getDaoFactory());
                try {
                    userService.createUser(user);

                    HttpSession session = request.getSession(true);
                    session.setAttribute("currentUser", user);

                    String jspPage = "/home";
                    String redirectURL = request.getContextPath() + jspPage;
                    response.sendRedirect(redirectURL);
                } catch (ParseException e) {
                    errorRedirect(request, response);
                }
            } else {
                request.setAttribute("errors", errors);
                errorRedirect(request, response);
            }
        }

        private List<String> validateUserInput(UserDto user) {
            return UserDtoValidator.getInstance().validate(user);
        }

        private void errorRedirect(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            String jspPage = "/WEB-INF/views/registration.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
            dispatcher.forward(request, response);
        }

        private UserDto getInput(HttpServletRequest request) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String dateOfBirth = request.getParameter("dateOfBirth");
            Role role = Role.CLIENT;

            return new UserDto.Builder()
                    .setDateOfBirth(dateOfBirth)
                    .setName(firstName)
                    .setSurname(lastName)
                    .setUsername(username)
                    .setPassword(password)
                    .setRole(role)
                    .build();
        }


}

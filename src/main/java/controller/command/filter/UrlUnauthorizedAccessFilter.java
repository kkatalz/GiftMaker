package controller.command.filter;

import controller.command.utils.HttpWrapper;
import controller.command.utils.RedirectionManager;
import controller.command.utils.SessionManager;
import entity.Role;
import entity.User;
import locale.Message;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebFilter(urlPatterns = { "/admin/*", "/client/*" })
public class UrlUnauthorizedAccessFilter implements Filter {

    private static final String UNAUTHORIZED_ACCESS = "Unauthorized access to the resource: ";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;

        User user = SessionManager.getInstance().getUserFromSession(httpRequest.getSession());

        if (!isUserRegistered(user) || !isUserAuthorizedForResource(httpRequest.getRequestURI(), user)) {
            logInfoAboutUnauthorizedAccess(httpRequest.getRequestURI());
            Map<String, String> urlParams = new HashMap<>();
            urlParams.put("error", Message.UNAUTHORIZED_ACCESS_ERROR);
            // redirect to login page
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login?error=" + Message.UNAUTHORIZED_ACCESS_ERROR);


            return;
        }

        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }

    private boolean isUserRegistered(User user) {
        return user != null;

    }

    private boolean isUserAuthorizedForResource(String servletPath, User user) {
        return (isAdminPage(servletPath) && user.getRole().equals(Role.ADMINISTRATOR))
                || (isClientPage(servletPath) && user.getRole().equals(Role.CLIENT));
    }

    private boolean isAdminPage(String requestURI) {
        return requestURI.contains(Role.ADMINISTRATOR.getValue());
    }

    private boolean isClientPage(String requestURI) {
        return requestURI.contains(Role.CLIENT.getValue());
    }

    private void logInfoAboutUnauthorizedAccess(String uri) {
        System.out.println(UNAUTHORIZED_ACCESS + uri);
    }
}

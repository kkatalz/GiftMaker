package controller.command.filter;

import controller.command.utils.RedirectionManager;
import locale.Message;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;


@WebFilter(urlPatterns = { "/views/*" })
public class DirectViewAccessFilter implements Filter {

	private static String UNAUTHORIZED_ACCESS = "Unauthorized access to the resource: ";

	public void init(FilterConfig fConfig) throws ServletException {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		logInfoAboutUnauthorizedAccess(httpRequest.getRequestURI());
		httpResponse.sendRedirect(toHomePageWithErrorMessage(httpRequest.getContextPath()));
	}

	public void destroy() {
	}

	private String toHomePageWithErrorMessage(String contextPath) throws UnsupportedEncodingException {
		Map<String, String> urlParams = new HashMap<>();
		return new StringBuffer(contextPath).append("/home")
				.append(RedirectionManager.getInstance().generateUrlParams(urlParams)).toString();
	}

	private void logInfoAboutUnauthorizedAccess(String uri) {
		System.out.println(UNAUTHORIZED_ACCESS + uri);
	}
}

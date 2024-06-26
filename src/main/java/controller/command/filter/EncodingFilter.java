package controller.command.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;


@WebFilter(urlPatterns = { "/*" }, initParams = {
		@WebInitParam(name = "encoding", value = "UTF-8", description = "Encoding Parameter") })
public class EncodingFilter implements Filter {

	private static String ENCODING = "encoding";
	private String code;

	public void init(FilterConfig fConfig) throws ServletException {
		code = fConfig.getInitParameter(ENCODING);
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String codeRequest = request.getCharacterEncoding();

		if (code != null && !code.equalsIgnoreCase(codeRequest)) {
			request.setCharacterEncoding(code);
			response.setCharacterEncoding(code);
		}
		chain.doFilter(request, response);
	}

	public void destroy() {
		code = null;
	}
}

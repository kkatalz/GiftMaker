package controller.command.utils;

import entity.User;

import javax.servlet.http.HttpSession;

public class SessionManager {


	static final String USER_HAS_LOGGED_IN = "User has logged in: ";
	static final String USER_HAS_LOGGED_OUT = "User has logged out: ";

	SessionManager() {
	}

	private static final class Holder {
		static final SessionManager INSTANCE = new SessionManager();
	}

	public static SessionManager getInstance() {
		return Holder.INSTANCE;
	}

	public boolean isUserLoggedIn(HttpSession session) {
		return session.getAttribute("currentUser") != null;
	}

	public void addUserToSession(HttpSession session, User user) {
		session.setAttribute("currentUser", user);
	}

	public User getUserFromSession(HttpSession session) {
		return (User) session.getAttribute("currentUser");
	}

	public void invalidateSession(HttpSession session) {
		if (session != null && session.getAttribute("currentUser") != null) {
			executeSessionInvalidation(session);
		}
	}

	private void executeSessionInvalidation(HttpSession session) {
		User user = (User) session.getAttribute("currentUser");
		System.out.println(String.format(USER_HAS_LOGGED_OUT, user.getName()));
		session.invalidate();
	}
}
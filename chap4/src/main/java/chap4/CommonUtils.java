package chap4;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CommonUtils {
	public void setCookie(HttpServletResponse res, String key, HttpServletRequest req, String value){
		Cookie cookie = new Cookie(key,value);
		cookie.setPath(req.getContextPath());
		cookie.setMaxAge(60*60*24);
		res.addCookie(cookie);
	}
	
	public String getCookie(Cookie[] cookies, String key){
		if (cookies != null) {
			for(Cookie c : cookies){
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				if(cookieName.equals(key)){
					return cookieValue;
				}
			}
		}
		return null;
	}
}

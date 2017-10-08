package com.mvc.filters;

import javax.servlet.*;
import java.io.IOException;

public class SiteHitCounter implements Filter {

	private int hitCount;

	public void init(FilterConfig filterConfig) throws ServletException {
		// Reset hit counter.
		hitCount = 0;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// increase counter by one
		hitCount++;

		
		
		request.getServletContext().setAttribute("websiteCounter", hitCount); // add to application context

		// Pass request back down the filter chain
		chain.doFilter(request, response);
	}

	public void destroy() {
		// This is optional step but if you like you
		// can write hitCount value in your database.
	}
}
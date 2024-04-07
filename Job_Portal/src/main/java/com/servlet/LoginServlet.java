package com.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        UserDAO dao = new UserDAO(DBConnect.getConnection()); 
        User user = null;
        try {
        	 user = dao.login(email, password);
            // Simulate user authentication (replace with your actual authentication logic)
            if (user!=null && user.getRole().equals("admin")) {
            	
            	//"admin@gmail.com".equals(email) && "admin@121".equals(password)
                //User user = new User();
                //user.setRole("admin");
              
                session.setAttribute("userobj", user);
                System.out.println("Admin Block");
                resp.sendRedirect("admin.jsp");
            } else {
            	System.out.println("User Details "+user);
				if(user!=null)
            	{
            		session.setAttribute("userobj",user);
            		System.out.println("User Block");
            		resp.sendRedirect("home.jsp");
            	}
				else {
            		session.setAttribute("succMsg","Invalid Email & password");
            		System.out.println("Inavlid Block");
            		resp.sendRedirect("login.jsp");
            	}
            	
            	            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?error=unknown"); // Redirect to login page with unknown error message
        }
    }
}

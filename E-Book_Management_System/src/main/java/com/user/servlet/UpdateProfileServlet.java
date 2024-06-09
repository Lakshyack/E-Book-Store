package com.user.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.Part;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.helper.helper;
import com.user.entity.Admin;
import com.user.entity.User;

@WebServlet("/update_profile")
@MultipartConfig
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();
			Integer userId = (Integer) session.getAttribute("user_id");
			String oldPass =(String) session.getAttribute("USpass");
			User u = (User) session.getAttribute("u");
			String oldFile = u.getProfile();
			if (userId == null) {
				throw new IllegalArgumentException("User ID not found in session. Please login again.");
			}

			String fname = req.getParameter("user_name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			Part part = req.getPart("file");
			System.out.println(part);
			String profile = part.getSubmittedFileName();

			// Print all parameters to console


			User us = new User();
			us.setId(userId);
			us.setName(fname);
			us.setEmail(email);
			us.setPassword(password);
			us.setPhno(phno);
			if (us.getProfile() != null) {
				oldFile = us.getProfile();
				us.setProfile(profile);
			} else {
				us.setProfile(profile);
			}

			String path = getServletContext().getRealPath("") + "UserProfile";
			String pathForDeleteFile = req.getRealPath("/") + "UserProfile" + File.separator + oldFile;


			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
			boolean f = dao.checkPassword(userId,oldPass );

			if (!oldFile.equals("Default.png")) {
				helper.deleteFile(pathForDeleteFile);
			}

			File file = new File(path);
			part.write(path + File.separator + profile);

			if (f) {
				boolean f2 = dao.updateProfile(us);
				User AD = dao.login(email,password);
				if (f2) {
					session.setAttribute("succMsg", "Profile Update Successfully !!!");
					session.setAttribute("userobj", AD);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedMsg", "Something Wrong On Server");
					resp.sendRedirect("index.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "Your Password Is Incorrect !!!");
				resp.sendRedirect("edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

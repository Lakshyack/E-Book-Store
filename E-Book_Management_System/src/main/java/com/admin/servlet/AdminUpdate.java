package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.Part;

import com.DAO.AdminDao;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.helper.helper;
import com.user.entity.Admin;
import com.user.entity.User;

@WebServlet("/admin/AdminUpdate")
@MultipartConfig
public class AdminUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            HttpSession session = req.getSession();
            Integer userId = (Integer) session.getAttribute("Admin_id");
            String oldPass =(String) session.getAttribute("Adpass");
            Admin u = (Admin) session.getAttribute("A");
            String oldFile = u.getProfile();
            if (userId == null) {
                throw new IllegalArgumentException("User ID not found in session. Please login again.");
            }

            String fname = req.getParameter("user_name");
            String email = req.getParameter("email");

            String password = req.getParameter("password");
            Part part = req.getPart("file");
            System.out.println(part);
            String profile = part.getSubmittedFileName();

            // Print all parameters to console


            Admin us = new Admin();
            us.setId(userId);
            us.setName(fname);
            us.setEmail(email);
            us.setPassword(password);
            if (us.getProfile() != null) {
                oldFile = us.getProfile();
                us.setProfile(profile);
            } else {
                us.setProfile(profile);
            }

            String path = getServletContext().getRealPath("") + "AdminProfile";
            String pathForDeleteFile = req.getRealPath("/") + "AdminProfile" + File.separator + oldFile;


            AdminDao dao = new AdminDao(DBConnect.getConnection());
            boolean f = dao.checkPassword(userId, oldPass);

            if (!oldFile.equals("Default.png") ) {
                helper.deleteFile(pathForDeleteFile);
            }

            File file = new File(path);
            part.write(path + file.separator + profile);

            if (f) {
                boolean f2 = dao.updateProfile(us);
                Admin AD = dao.login(email,password);
                if (f2) {
                    session.setAttribute("succMsg", "Profile Update Successfully !!!");
                    session.setAttribute("Adminobj", AD);
                    resp.sendRedirect("home.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something Wrong On Server");
                    resp.sendRedirect("home.jsp");
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

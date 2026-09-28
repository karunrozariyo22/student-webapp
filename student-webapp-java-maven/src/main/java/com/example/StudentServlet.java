package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Student> students = new ArrayList<>();

        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT id, name, email, course FROM students ORDER BY id DESC");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                students.add(new Student(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("course")
                ));
            }
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
        }

        request.setAttribute("students", students);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "INSERT INTO students(name,email,course) VALUES (?,?,?)")) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, course);
            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/students");
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }
    }

    public record Student(int id, String name, String email, String course) {}
}

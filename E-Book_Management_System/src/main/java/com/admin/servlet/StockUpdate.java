package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.user.entity.BookDtls;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class StockUpdate {
    private Connection con;

    public StockUpdate() {
        this.con = DBConnect.getConnection();
    }

    public boolean updateStock(int id) {
        boolean f = false;

        try {
            // Get the book details by ID
            BookDAOImpl bookDAO = new BookDAOImpl(con);
            BookDtls book = bookDAO.getBookById(id);

            if (book != null) {
                String oldStock = book.getStock();
                int intStock = Integer.parseInt(oldStock);
                String newStock = Integer.toString(intStock - 1);

                // Prepare SQL statement
                String sql = "UPDATE book_dtls SET stock = ? WHERE bookId = ?";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, newStock);
                ps.setInt(2, id);

                // Execute the update
                int x = ps.executeUpdate();
                if (x == 1) {
                    f = true;
                }

                // Close the PreparedStatement
                ps.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the connection
            try {
                if (con != null && !con.isClosed()) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return f;
    }

    public static void main(String[] args) {
        StockUpdate stockUpdate = new StockUpdate();
        boolean result = stockUpdate.updateStock(1); // Example book ID
        System.out.println("Stock updated: " + result);
    }
}

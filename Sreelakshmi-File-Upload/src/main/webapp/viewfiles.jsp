<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, java.util.*" %>
<%@ page import="db.DBConnection" %>
<%
    // Initialize an empty list to hold file details
    List<String> fileList = new ArrayList<>();

    try (Connection conn = DBConnection.getConnection()) {
        String sql = "SELECT id, file_type FROM files"; // Adjust SQL query as needed
        PreparedStatement statement = conn.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();

        // Loop through the result set and add file details to the list
        while (resultSet.next()) {
            int fileId = resultSet.getInt("id");
            String fileType = resultSet.getString("file_type");
            fileList.add("File ID: " + fileId + ", File Type: " + fileType);
        }
    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
        ex.printStackTrace();
    }

    // Display the files
    if (fileList.isEmpty()) {
        out.println("<p>No files found in the database.</p>");
    } else {
        out.println("<h2>Uploaded Files:</h2>");
        out.println("<ul>");
        for (String fileDetails : fileList) {
            out.println("<li>" + fileDetails + "</li>");
        }
        out.println("</ul>");
    }
%>

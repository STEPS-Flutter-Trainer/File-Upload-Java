<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*, java.util.*" %>
<%@ page import="db.DBConnection" %>
<%
    // Check if form has been submitted with a file
    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try (Connection conn = DBConnection.getConnection()) { // Use DBConnection class
            // Parse the request to get file items
            List<FileItem> formItems = upload.parseRequest(request);

            for (FileItem item : formItems) {
                // Check if this item is a file upload
                if (!item.isFormField()) {
                    // Get file input stream
                    InputStream inputStream = item.getInputStream();
                    String fileType = item.getContentType();
                    // Read file into a byte array
                    byte[] fileBytes = item.get();

                    // Use setBytes to insert the byte array into the database
                    String sql = "INSERT INTO files (file_data, file_type) VALUES (?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setBytes(1, fileBytes);
                    statement.setString(2, fileType);

                    int row = statement.executeUpdate();
                    if (row > 0) {
                        out.println("File uploaded and saved in the database.");
                    }
                    inputStream.close();
                }
            }
        } catch (Exception ex) {
            out.println("Error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
%>

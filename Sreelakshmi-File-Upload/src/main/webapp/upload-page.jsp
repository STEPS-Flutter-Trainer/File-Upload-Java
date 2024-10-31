<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
    <label for="file">Choose Image/PDF:</label>
    <input type="file" name="file" accept="image/*,application/pdf" required>
    <button type="submit">Upload</button>
</form>
</body>
</html>
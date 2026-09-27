<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Database</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 40px;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #333;
            color: white;
        }
    </style>
</head>

<body>

<h2>Student Details</h2>

<table>

    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Course</th>
    </tr>

<%
    String url = "jdbc:mysql://localhost:3306/db";
    String username = "root";
    String password = "Praveen@1516";

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                url,
                username,
                password
        );

        String sql = "SELECT * FROM students";

        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
%>

    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getInt("age") %></td>
        <td><%= rs.getString("course") %></td>
    </tr>

<%
        }

        rs.close();
        stmt.close();
        con.close();

    } catch (Exception e) {
%>

    <tr>
        <td colspan="4">
            Database Error: <%= e.getMessage() %>
        </td>
    </tr>

<%
    }
%>

</table>

</body>
</html>
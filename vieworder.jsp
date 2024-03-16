<%@  page import="java.sql.* "%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="/all_component/allCSS.jsp" %>
    <link rel="stylesheet" href="style1.css">
    <style>
     
        .plk
        {
          width: 50px;
          height: 50px;
        }
    </style>
</head>
<body class="bg-color">
    <%@include file="all_component/navbar.jsp" %>
    <div class="container p-3">
      <%@include file="msg.jsp" %>
        <table class="table table-striped bg-light">
            <thead class="bg-dark text-white">
              <tr>
                <th scope="col">Name</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author Name</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Payment Type</th>
                <th scope="col">Images</th>
                <th scope="col">Time</th>
              </tr>
            </thead>
            <tbody>
            <%
            try
            {
              String email=(String)session.getAttribute("email");
              Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
              String query="select * from uorder where email='"+email+"'";
              PreparedStatement ps=con.prepareStatement(query);
              ResultSet rs=ps.executeQuery(query);
              while(rs.next())
              {
            %>
           
              <tr>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(8) %></td>
                <td><%= rs.getString(9) %></td>
                <td><%= rs.getString(10) %></td>
                <td><img src="Book/<%= rs.getString(12) %>" class="plk"></td>
                <td><%= rs.getString(13) %></td>
              </tr>
            
            <%
              }
            }
            catch(Exception e)
            {

            }
            %>
          </tbody>
          </table>
    </div>
  
</body>
</html>
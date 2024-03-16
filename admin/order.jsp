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
</head>
<body class="bg-color">
    <%@include file="all_component/navbar.jsp" %>
    <div class="container p-3">
        <table class="table table-striped bg-light">
            <thead class="bg-dark text-white">
              <tr>
                <th scope="col" >Order ID</th>
                <th scope="col">Name</th>
                <th scope="col">E-mail</th>
               
                <th scope="col">Address</th>
                
                <th scope="col">Book Name</th>
                <th scope="col">Author Name</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Patment type</th>
                <th scope="col">Time</th>
              </tr>
            </thead>
            <tbody>
                <%
                try
                {
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
                  String query="select * from uorder";
                  PreparedStatement ps=con.prepareStatement(query);
                  ResultSet rs=ps.executeQuery(query);
                  while(rs.next())
                  {
                %>
           
              <tr>
                <th class="text-info"><%= rs.getString(1) %></th>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
              
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(8) %></td>
                <td><%= rs.getString(9) %></td>
                <td><%= rs.getString(10) %></td>
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
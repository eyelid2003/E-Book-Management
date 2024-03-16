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
                <th scope="col" >ID</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author Name</th>
                <th scope="col">Price</th>
                <th scope="col">Book Catagries</th>
                <th scope="col">Book Status</th>
                <th scope="col">Images</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
            <%
            try
            {
              Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
              String query="select * from books where email='admin'";
              PreparedStatement ps=con.prepareStatement(query);
              ResultSet rs=ps.executeQuery(query);
              while(rs.next())
              {
            %>
           
              <tr>
                <th class="text-info"><%= rs.getString(1) %></th>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><img src="../Book/<%= rs.getString(7) %>" class="plk"></td>
                <td>
                    <a href="editbook.jsp?id=<%= rs.getString(1) %>" class="btn btn-sm btn-primary"><i class="fa-regular fa-pen-to-square"></i>Edit</a>
                    <a href="../DeleteBook?id=<%= rs.getString(1) %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Delete</a>
                </td>
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
    <%@include file="all_component/footer.jsp" %>
</body>
</html>
<%@  page import="java.sql.* "%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="all_component/allCSS.jsp" %>
    <link rel="stylesheet" href="style1.css">
</head>
<body class="bg-color">
    <%@include file="all_component/navbar.jsp" %>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <%@include file="msg.jsp" %>
                        <h4 class="text-center">Edit Book</h4>
                        <form action="../EditBook" method="post">
                        <%
                            String bid=request.getParameter("id");
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver"); 
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root"); 
                                String query="select * from books where bid='"+bid+"'";
                                PreparedStatement ps=con.prepareStatement(query);
                                ResultSet rs=ps.executeQuery(query);
                                rs.next();
                            %>
                        
                            <div class="form-group">
                                <input name="bid" type="hidden" value="<%= request.getParameter("id") %>">
                                <p class="text-center">Book ID is:<b><%= request.getParameter("id") %></b></p>
                                
                                <label for="bname">Book Name</label>
                                <input type="text" class="form-control" id="bname" name="bname" value="<%= rs.getString(2) %>" placeholder="Book Name">
                            </div>
            
                            <div class="form-group">
                                <label for="aname">Author Name</label>
                                <input type="text" class="form-control" id="aname" value="<%= rs.getString(3) %>" name="aname" placeholder="Author Name">
                            </div>
                        
                            <div class="form-group">
                              <label for="price">Price</label>
                              <input type="number" class="form-control" name="price" value="<%= rs.getString(4) %>" id="price" placeholder="Price">
                            </div>

                            <div class="form-group">
                                <label class="my-1 mr-2" for="bookStatus">Book Status</label>
                                <select class="custom-select my-1 mr-sm-2" id="bookStatus" name="bookStatus">
                                    <option value="select">....select....</option>
                                    <option value="active">Active</option>
                                    <option value="inactive">Inactive</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg" onclick="return p1()">Update</button>
                            </div>
                            <%
                            }
                        catch(Exception ex)
                                {}
                        %>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="all_component/footer.jsp" %>
    <script>
        function p1()
        {
            a=document.getElementById("bookStatus").value
            if(a=="select")
            {
                alert("Select book Status")
                return false
            }
        }
    </script>
</body>
</html>
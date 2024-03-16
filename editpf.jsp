<%@ page import="java.sql.* " %>
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
            <%
                String uid=(String)session.getAttribute("uid");
                String email=(String)session.getAttribute("email");
                String name=(String)session.getAttribute("username");
                try 
                { 
                    Class.forName("com.mysql.jdbc.Driver"); Connection
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root"); String
                    query="select * from account where uid='"+uid+"'" ; 
                    PreparedStatement ps=con.prepareStatement(query); 
                    ResultSet rs=ps.executeQuery(query); 
                    while(rs.next()) 
                    {
            %>
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <%@include file="msg.jsp" %>
                    <div class="card-body">
                        <h3 class="text-center">Update & Complete Your Account</h3>
                        <form action="EditPF" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" value="<%= name %>"  readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="email">Email</label>
                                    <input type="text" class="form-control" id="email" name="email" value="<%= email %>" readonly >
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="pass">Password</label>
                                    <input type="password" class="form-control" id="pass" name="pass" value="<%= rs.getString(4) %>" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="contact">Phone number</label>
                                    <input type="text" class="form-control" id="contact" name="contact" value="<%= rs.getString(5) %>" required>
                                </div>
                               
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="lm">Land Mark</label>
                                    <input type="text" class="form-control" id="lm" name="lm" value="<%= rs.getString(6) %>" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="city">City</label>
                                    <input type="text" class="form-control" id="city" name="city" value="<%= rs.getString(7) %>" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="state">State</label>
                                    <input type="text" class="form-control" id="state" name="state" value="<%= rs.getString(8) %>" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="zip">Zip</label>
                                    <input type="text" class="form-control" id="zip" name="zip" value="<%= rs.getString(9) %>" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="my-1 mr-2" for="address">Address</label>
                                <input type="text" class="form-control" id="address" name="address" value="<%= rs.getString(10) %>" required>
                               
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-success">Submit</button>
            
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <% 
							}
							
						} 
						catch(Exception e) 
						{ 
						} 
					%>
        </div>
    </div>
    <%@include file="all_component/footer.jsp" %>
</body>
</html>
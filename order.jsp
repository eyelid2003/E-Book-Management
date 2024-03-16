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
    <style>
    .plk
    {
        width: 170px;
        height: 200px;
	}
	.crd-ho:hover 
	{
        background-color: #fcf7f7;
    }
    </style>
</head>
<body class="bg-color">
    <%@include file="all_component/navbar.jsp" %>
    <div class="container p-3">
        <%@include file="msg.jsp" %>
        <div class="row">

            <%
                String bid= request.getParameter("id");

                try 
                { 
                    Class.forName("com.mysql.jdbc.Driver"); 
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root"); 
                    String query="select * from books where bid='"+bid+"' " ; 
                    PreparedStatement ps=con.prepareStatement(query);
                    ResultSet rs=ps.executeQuery(query); 
                    while(rs.next()) 
                    {
            %>
            <div class="col-md-6 text-center p-5 border bg-white">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="Book/<%= rs.getString(7) %>" class="img-thumbnail plk">
                        <h4 class="mt-3">Book Name <span class="text-success"><%= rs.getString(2) %></span></h4>
                <h4>Book Author <span class="text-success"><%= rs.getString(3) %></span></h4>
                <h4>Book Price <span class="text-success"><%= rs.getString(4) %> <i class="fa-solid fa-indian-rupee-sign"></i></span></h4>
                        
                        <div class="row ">
                            <div class="col-6">
                                <a href="Cart?uid=<%= session.getAttribute("uid")%>&&bid=<%= rs.getString(1) %>" class="btn btn-warning  "><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
                            </div>
                            <div class="col-6">
                                <a href="viewdetail.jsp?id=<%= rs.getString(1) %>" class="btn btn-success  ">View Detail</a>
                            </div>
                          
                        </div>
                    </div>
                </div>
            </div>
            <% } 
            
        } catch(Exception e) { } %>
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
            <div class="col-md-6 text-center p-5 border bg-white">
                <div class="card crd-ho">
                    <div class="card-body">
                        <h3 class="text-center">Form detail order</h3>
                        <form action="Order" method="post">
                            <input type="hidden" name="bid" value="<%= bid %>">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" value="<%= name %>" name="name" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="email">Email</label>
                                    <input type="text" class="form-control" id="email" value="<%= email %>" name="email" readonly >
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="contact">Phone number</label>
                                    <input type="text" class="form-control" id="contact" value="<%= rs.getString(5) %>" name="contact" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="lm">Land Mark</label>
                                    <input type="text" class="form-control" id="lm" value="<%= rs.getString(6) %>" name="lm" required>
                                </div>
                                
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="city">City</label>
                                    <input type="text" class="form-control" id="city" value="<%= rs.getString(7) %>" name="city" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="state">State</label>
                                    <input type="text" class="form-control" id="state" value="<%= rs.getString(8) %>" name="state" required>
                                </div>
                               

                            </div>
                            <div class="form-row">
                                
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="zip">Zip</label>
                                    <input type="text" class="form-control" id="zip" value="<%= rs.getString(9) %>" name="zip" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="address">Address</label>
                                    <input type="text" class="form-control" id="address" value="<%= rs.getString(10) %>" name="address" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="form-label" for="quantity">Quantity </label>
                                    <input type="text" class="form-control" id="quantity"  name="quantity" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="my-1 mr-2" for="paytype">Payment Type</label>
                                    <select class="custom-select my-1 mr-sm-2" id="paytype" name="paytype" >
                                        <option value="select">....select....</option>
                                        <option value="cod">Cash on deleviry</option>
                                        <option value="op">Onile Payment</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-warning" onclick="return p1()">Order Now</button>
                                <a href="index.jsp" class="btn btn-success">Continue shoping</a>
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
    <script>
        function p1()
        {
            a=document.getElementById("paytype").value
            if(a=="select")
            {
                alert("Select Payment Type")
                return false
            }
            b=document.getElementById("address").value
            if(b=="null")
            {
                alert("Enter Your Address")
                return false
            }
            c=document.getElementById("zip").value
            if(c==0)
            {
                alert("Enter Your zip")
                return false
            }
            d=document.getElementById("state").value
            if(d=="null")
            {
                alert("Enter Your State")
                return false
            }
            f=document.getElementById("city").value
            if(f=="null")
            {
                alert("Enter Your City")
                return false
            }
            g=document.getElementById("lm").value
            if(g=="null")
            {
                alert("Enter Your LandMark")
                return false
            }
        }
    </script>
</body>
</html>
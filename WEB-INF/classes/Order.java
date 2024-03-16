import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
public class Order extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        PrintWriter p=res.getWriter();
        Date thisDate= new Date();
        SimpleDateFormat dateForm= new SimpleDateFormat("MM/dd/Y h:mm");
        String timee=dateForm.format(thisDate);
        String uname=req.getParameter("name");
        String email=req.getParameter("email");
        String contact =req.getParameter("contact");
        String address =req.getParameter("address");
        String bid =req.getParameter("bid");
        int quantity =Integer.parseInt(req.getParameter("quantity"));
        String paytype =req.getParameter("paytype");
        RequestDispatcher dis=null;
        HttpSession htps=req.getSession();
       try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
            String query="select * from books where bid='"+bid+"'";
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery(query);
            
            if(rs.next())
            {
                
                String bname=rs.getString(2);
                String aname=rs.getString(3);
                int price=Integer.parseInt(rs.getString(4));
                int tprice=price*quantity;
                String pname=rs.getString(7);
                String query1=" insert into uorder (uname,email,contact,address,bname,aname,tprice,quantity,paytype,bid,pname,timee) values ('"+uname+"','"+email+"','"+contact+"','"+address+"','"+bname+"','"+aname+"','"+tprice+"','"+quantity+"','"+paytype+"','"+bid+"','"+pname+"','"+timee+"') ";
                ps=con.prepareStatement(query1);
                int i=ps.executeUpdate();
            
                if(i==1)
                {
                 
                    res.sendRedirect("lastpage.jsp");
                    return;
                //dis=req.getRequestDispatcher("login.jsp");
                }
                else
                {
                    htps.setAttribute("failed","somethins iss wrong");
                    res.sendRedirect("index.jsp");
                    return;
               
                }
            }
            else
            {
                htps.setAttribute("failed","somethins iss wrong");
                res.sendRedirect("index.jsp");
                return;
                
            }
           
        }
        catch(Exception e)
        {
            //htps.setAttribute("error","sothing is wrong");
            //res.sendRedirect("index.jsp");
            //return;
          p.print(e);
        }
      
    }
}
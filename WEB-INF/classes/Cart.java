import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class Cart extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doGet(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        int uid=Integer.parseInt(req.getParameter("uid"));
        int bid=Integer.parseInt(req.getParameter("bid"));
        PrintWriter p=res.getWriter();
        HttpSession htps=req.getSession();
        PreparedStatement ps=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
            String sql="select*from books where bid='"+bid+"'";
            ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery(sql);
            if(rs.next())
            {
                String bname=rs.getString(2);
                String aname=rs.getString(3);
                String price=rs.getString(4);
                String pname=rs.getString(7);
                String bookCat=rs.getString(5);
                String email=rs.getString(8);
                String query=" insert into cart (bid,uid,bname,aname,price,pname,bookCat,email) values ('"+bid+"','"+uid+"','"+bname+"','"+aname+"','"+price+"','"+pname+"','"+bookCat+"','"+email+"') ";
                ps=con.prepareStatement(query);
                int i=ps.executeUpdate();
            
                if(i==1)
                {
                    htps.setAttribute("sucess","Add to Cart Sucessfully :)");
                    res.sendRedirect("index.jsp");
                return;
                }
                else
                {
                    htps.setAttribute("failed","sothing iss wrong");
                    res.sendRedirect("index.jsp");
                    return;
                }
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
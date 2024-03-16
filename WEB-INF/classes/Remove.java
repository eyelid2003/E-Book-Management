import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class Remove extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doGet(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        int cid=Integer.parseInt(req.getParameter("cid"));
        PrintWriter p=res.getWriter();
        HttpSession htps=req.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
            String query=" delete from cart where cid='"+cid+"' ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            
            if(i==1)
            {
                htps.setAttribute("sucess","Book remove Sucessfully :)");
                res.sendRedirect("cart.jsp");
                return;
            }
            else
            {
                htps.setAttribute("failed","sothing iss wrong");
                res.sendRedirect("cart.jsp");
                return;
            }
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("cart.jsp");
            return;
            //p.print(e);
        }
    }
}
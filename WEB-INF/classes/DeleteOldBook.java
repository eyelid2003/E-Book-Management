import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class DeleteOldBook extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doGet(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        int bid=Integer.parseInt(req.getParameter("id"));
        PrintWriter p=res.getWriter();
        HttpSession htps=req.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
            String query=" delete from books where bid='"+bid+"' ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            
            if(i==1)
            {
                htps.setAttribute("sucess","Book deleted Sucessfully :)");
                res.sendRedirect("allsell.jsp");
                return;
            }
            else
            {
                htps.setAttribute("failed","sothing iss wrong");
                res.sendRedirect("allsell.jsp");
                return;
            }
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("allsell.jsp");
            return;
            //p.print(e);
        }
    }
}
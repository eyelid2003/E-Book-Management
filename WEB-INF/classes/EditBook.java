import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class EditBook extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {

        PrintWriter p=res.getWriter();
        String s=req.getParameter("bid");
        int bid =Integer.parseInt(s);
        String bname =req.getParameter("bname");
        String aname =req.getParameter("aname");
        String price =req.getParameter("price");
        String bookStatus =req.getParameter("bookStatus");
        HttpSession htps=req.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
            String query="update books set bname='"+bname+"',aname='"+aname+"',price='"+price+"',bookStatus='"+bookStatus+"' where bid='"+bid+"' ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            
            if(i==1)
            {
                htps.setAttribute("sucess","Book Update Sucessfully :)");
                res.sendRedirect("admin/allBook.jsp");
                return;
            }
            else
            {
                htps.setAttribute("failed","sothing iss wrong");
                res.sendRedirect("admin/allBook.jsp");
                return;
            }
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("admin/allBook.jsp");
            return;
            //p.print(e);
        }
    }
}
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class Login extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        PrintWriter p=res.getWriter();
        String name =req.getParameter("name");
        String pass =req.getParameter("pass");
        String email =req.getParameter("email");
        RequestDispatcher dis=null;
        HttpSession htps=req.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
            String query="select * from account where pass='"+pass+"' and email='"+email+"'";
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery(query);
            
            if(rs.next())
            {
                htps.setAttribute("username",name);
                htps.setAttribute("email",email);
                String uid=rs.getString(1);
                htps.setAttribute("uid",uid);
                res.sendRedirect("index.jsp");
                return;
                //dis=req.getRequestDispatcher("index.jsp");
            }
            else
            {
                htps.setAttribute("failed","sothing iss wrong");
                res.sendRedirect("login.jsp");
                return;
                //dis=req.getRequestDispatcher("login.jsp");
            }
            //dis.forward(req,res);
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("sign.jsp");
            return;
        }
    }
}
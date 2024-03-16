import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class Signin extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        
        PrintWriter out=res.getWriter();
        String name =req.getParameter("name");
        String email =req.getParameter("email");
        String pass =req.getParameter("pass");
        String contact =req.getParameter("contact");
        HttpSession htps=req.getSession();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
            String sql="select *from account where email='"+email+"'";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery(sql);
            if(rs.next())
            {
                htps.setAttribute("failed","Account already Exist");
                res.sendRedirect("sign.jsp");
                return;
            }
            else
            {
                String query=" insert into account (name,email,pass,contact,lm,city,state,zip,address) values ('"+name+"','"+email+"','"+pass+"','"+contact+"','null','null','null',000,'null') ";
                ps=con.prepareStatement(query);
                int i=ps.executeUpdate();
            
                if(i==1)
                {
                    htps.setAttribute("sucess","account creates");
                    res.sendRedirect("sign.jsp");
                    return;
                
                }
                else
                {
                    htps.setAttribute("failed","something iss wrong");
                    res.sendRedirect("sign.jsp");
                    return;
                
                }
        
            }

        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("sign.jsp");
            return;
        }
    }
}

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import javax.servlet.annotation.*;
import javax.servlet.http.Part;
@MultipartConfig
public class SellBook extends HttpServlet
{
    private static final long serialVersionUID= 1L;
    protected void doPost(HttpServletRequest req ,HttpServletResponse res) throws ServletException,IOException
    {
        res.setContentType("text/html");
        PrintWriter p=res.getWriter();
        String bname =req.getParameter("bname");
        String aname =req.getParameter("aname");
        String price =req.getParameter("price");
        String bookCat =req.getParameter("bookCat");
        String bookStatus =req.getParameter("bookStatus");
        
        Part photo=req.getPart("photo");
        String pname=photo.getSubmittedFileName();
        String path=getServletContext().getRealPath("") +"Book";
        File f=new File(path);
        photo.write(path+File.separator+pname);
        HttpSession htps=req.getSession();
        String email=(String)htps.getAttribute("email");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
            String query=" insert into books (bname,aname,price,bookCat,bookStatus,pname,email) values ('"+bname+"','"+aname+"','"+price+"','"+bookCat+"','"+bookStatus+"','"+pname+"','"+email+"') ";
            PreparedStatement ps=con.prepareStatement(query);
            int i=ps.executeUpdate();
            
            if(i==1)
            {
                htps.setAttribute("sucess","Sell Book Added Sucessfully :)");
                res.sendRedirect("sellbook.jsp");
                return;
            }
            else
            {
                htps.setAttribute("failed","sothing iss wrong");
                res.sendRedirect("sellbook.jsp");
                return;
            }
        }
        catch(Exception e)
        {
            htps.setAttribute("error","sothing is wrong");
            res.sendRedirect("sellbook.jsp");
            return;
            //p.print(e);
        }
    }
}
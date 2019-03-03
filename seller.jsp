<%-- 
    Document   : search
    Created on : 5 Feb, 2018, 7:26:25 PM
    Author     : Admin
--%>
<%@page import="dbutil.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         
        <h1>Seller!</h1>
        <hr>
        <form>
        <table>
        <tr>
            <td><input type="text" name ="seller_id" placeholder="seller_id"></td>
                   
                    
                           </tr> 
            <tr>
                
             <td></td>
             <td><input type="submit" value="search" name="b1"/></td>
            </tr>
</table>
</form>
         <%if(request.getParameter("b1")!=null)
        {
            try
                
            {DBConnect x = new DBConnect();
            String bg=request.getParameter("seller_id");
            
            out.println("<hr>");
            out.println("Selected Seller:"+bg);
            
            
            String sql="select sellerid,ratio from seller where sellerid='"+bg+
                    "'";
            ResultSet rs=x.queryReturner(sql);
            out.println("<table>");
            out.println("<td>");
            out.println("Seller_id");
            out.println("</td>");
            out.println("<td>");
            out.println("Ratio");
            out.println("</td>");
            out.println("</tr>");
            
            while(rs.next())
            {
                out.println("<tr>");
                  out.println("<td>");
                out.println(rs.getString(1));
                out.println("</td>");
                out.println("<td>");
                out.println(rs.getString(2));
                 out.println("</td>");
                  out.println("</tr>");
            }
            
            out.println("</table>");
             sql="select productid,ratio from product where sellerid='"+bg+
                    "'";
               rs=x.queryReturner(sql);
            out.println("<table>");
            out.println("<td>");
            out.println("Productid");
            out.println("</td>");
            out.println("<td>");
            out.println("Ratio");
            out.println("</td>");
            out.println("</tr>");
            
            
            while(rs.next())
            {
                out.println("<tr>");
                  out.println("<td>");
                out.println(rs.getString(1));
                out.println("</td>");
                out.println("<td>");
                out.println(rs.getString(2));
                 out.println("</td>");
                  out.println("</tr>");
            }
            
            out.println("</table>");
            }
            
            
        catch(Exception ex)
                {
                
                }}
        
        %>
                
                
    </body>
</html>

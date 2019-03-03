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
         
        <h1>Customer!</h1>
        <hr>
        <form>
        <table>
        <tr>
            <td><input type="text" name ="customer_id" placeholder="customer_id"></td>
                   
                    
                           </tr> 
            <tr>
                
             <td></td>
             <td><input type="submit" value="search" name="b2"/></td>
               </tr>
</table>  
        <%   String bg;

          
        %>
         <%if(request.getParameter("b2")!=null)
             
        {
            try
                
            {DBConnect x = new DBConnect();
             bg=request.getParameter("customer_id");
          
            out.println("<hr>");
            out.println("Selected customer:"+bg);
            
            
            String sql="select custid,ratio,credits from customer where custid='"+bg+
                    "'";
            ResultSet rs=x.queryReturner(sql);
            out.println("<table>");
            out.println("<td>");
            out.println("Customer_ID");
            out.println("</td>");
            out.println("<td>");
            out.println("Ratio");
            out.println("</td>");
            out.println("<td>");
            out.println("Credits");
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
                 out.println("<td>");
                out.println(rs.getString(3));
                 out.println("</td>");
                  out.println("</tr>");
            }
            
            
            out.println("</table>");
            }
            
            
             
            
        catch(Exception ex)
                {
                
                }}
         
        
        %>
      
        <table>
        <tr>
                <td>Products</td>
                        <td><select name="t3">
                        <option>A1</option>
                        <option>A2</option>
                        <option>A3</option>
                        <option>B1</option>
                        <option>B2</option>
                        <option>C1</option>
                        <option>C2</option>
                        <option>D1</option>
                         <option>E1</option>
                          <option>F1</option>
                        
                    </select>
                    
                </td>
                
                 <td><input type="submit" value="buy" name="b4"/></td>
                 <td><input type="submit" value="return" name="b3"/></td>
        </tr></table>
        
        
    
        <%if(request.getParameter("b4")!=null)
        {
            try
                
            {DBConnect x = new DBConnect();
            String bg1=request.getParameter("t3");
               String bg2=request.getParameter("customer_id");
            
            out.println("<hr>");
            out.println("Selected Product:"+bg1);out.println("Selected Customer:"+bg2);
            
            
            String sql="update product set P_total_Demands=P_total_Demands+1 where ProductID='"+bg1+
                    "'";
            
            
            x.queryExecuter(sql);
       sql="update product set RATIO=TOTAL_VALID_RETURNS/P_TOTAL_DEMANDS WHERE PRODUCTID='"+bg1+
                    "'";
                  
      
            
            
              x.queryExecuter(sql);
              
              sql="update CUSTOMER set TOTAL_TRANSACTIONS=TOTAL_TRANSACTIONS+1 WHERE CUSTID='"+bg2+
                    "'";
                  
      
            
            
              x.queryExecuter(sql);
              
               sql="update CUSTOMER set RATIO=TOTAL_FRAUDS/TOTAL_TRANSACTIONS WHERE CUSTID='"+bg2+
                    "'";
                  
      
            
            
              x.queryExecuter(sql);
              
               sql="update CUSTOMER set CREDITS=CREDITS+50 WHERE CUSTID='"+bg2+
                    "'";
                  
      
            
            
              x.queryExecuter(sql);
            
              
              sql="update seller set s_total_demands=s_total_demands+1 where sellerid=(select sellerid from product where productid='"+bg1+"')";
             x.queryExecuter(sql);
             
             sql="update seller set ratio=total_valid_returns/s_total_demands where sellerid=(select sellerid from product where productid='"+bg1+"')";
             x.queryExecuter(sql);
             
            }
            
            
                    catch(Exception ex)
                {
                
                }}
        
        %>
         </form>       
                  
    </body>
</html>

package clasesita;
import java.sql.*;
import static java.lang.System.out;
public class conectadita {
    Connection cnx = null;
    
    public Connection conectar(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/emps?autoreReconnect=true&useSSL=false","root","n0m3l0");
        }
        catch (ClassNotFoundException | SQLException error){
            out.print(error.toString());
        }
        return cnx;
    }
}

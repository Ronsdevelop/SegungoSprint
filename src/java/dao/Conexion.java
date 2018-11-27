
package dao;
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    
 public static Connection conectar()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bdhotelfinal?zeroDateTimeBehavior=convertToNull","root","");
        } catch (ClassNotFoundException  ex) {
            return null;
        }catch(SQLException ex){
            return null; 
        }
    }
 
 


   
}

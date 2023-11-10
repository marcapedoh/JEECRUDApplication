/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app.pk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author adral
 */
public class ConnectionToBD {
    public static Connection seConnecter(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionToBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String serveur= "jdbc:mysql://localhost:3306/JoueursTP";
        String user= "root";
        String password="";
        try {
            Connection connexion= DriverManager.getConnection(serveur,user,password);
            
            return connexion;
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionToBD.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}

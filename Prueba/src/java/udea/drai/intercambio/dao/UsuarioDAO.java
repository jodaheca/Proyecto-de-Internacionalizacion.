/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package udea.drai.intercambio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import udea.drai.intercambio.dto.login;

/**
 *
 * @author Usuario
 */
public class UsuarioDAO {
    private BDConexion conection;

    public UsuarioDAO() {
          this.conection = new BDConexion();
    }
    
    public login verificacion(String user){
         login lg = null;
        try{
           // conection = new BDConexion();
            Connection con = this.conection.getConnection();
            PreparedStatement st = con.prepareStatement(BDConexion.getStatement("verficarUsuario"));
            
            st.setString(1, user);
            System.out.println(st.toString());
            ResultSet rs= st.executeQuery();
            
           while(rs.next()){
               lg = new login();
                lg.setUsuario(user);
                lg.setContrasena(rs.getString("contrasena"));
                lg.setPermiso(rs.getInt("permisos"));
           }
           return lg;
        }catch(Exception e){
            System.out.println("Error extrayendo información de usuario!");
            return null;
        }
        
    }
    
}

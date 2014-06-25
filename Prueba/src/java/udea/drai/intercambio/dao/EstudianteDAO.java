/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package udea.drai.intercambio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import udea.drai.intercambio.dto.Persona;

/**
 *
 * @author Usuario
 */
public class EstudianteDAO {
    private BDConexion conection;
    
    public EstudianteDAO(){
        this.conection = new BDConexion();
    }
    
    public int modificarInfo(Persona e){
        
        try{
            Connection con = this.conection.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("modificarEstudiante"));
            ps.setString(1, e.getNombre());
            ps.setString(3, e.getPrograma());
            ps.setString(2, e.getEmail());
            ps.setString(4, e.getCedula());
            ps.setString(5, e.getUsuario());
            if (ps.executeUpdate() == 1){
                System.out.println("Modificacion exitosa!");
                
            }
        }catch(Exception ex){
            System.out.println("Error en la modificación! Error: "+ex);
                    
        }
        return 0;
    
    }
    public Persona getEstudianteXusuario(String user){
        Persona e = null;
        
        try{
            Connection con = this.conection.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("estudianteXusuario"));
            ps.setString(1 , user);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String nombre = rs.getString("nombre");
                String cedula = rs.getString("cedula");
                String prog = rs.getString("programa");
                String email = rs.getString("email");
                String ud = rs.getString("usuario");
                 e = new Persona(nombre, cedula , prog , email, ud);
                return e;
            }
        }catch(Exception ex){
            System.out.println("Error obteniendo estudiante");
        }
        
        return e;
    }
    
    
    
}



package udea.drai.intercambio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import udea.drai.intercambio.dto.Institucion;

/**
 *
 * @author Joaquin Hernandez
 * Clase encargada de realizar todas las operacion referentes a la base de datos para las Instituciones
 */
public class InstitucionDAO {
    private BDConexion conection;
    
    public InstitucionDAO(){
        this.conection = new BDConexion();
    }
    /**
    *
    * Metodo que permite agregar una nueva institucion a la base de datos
     * @param inst
    */
    public int agregarInstitucion(Institucion inst){
        try{
            Connection con = this.conection.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("agregarInstitucion"));
            ps.setString(1, inst.getNombre());
            ps.setString(2, inst.getPais());
            System.out.println(ps.toString());
            ps.executeUpdate();
            ps.close();
            return 1;
        }catch(Exception ex){
            System.out.println("Error al ingresar una nueva Institucion! Error: "+ex);
            return 2;        
    }
    }
    public List<Institucion> getInstituciones(){
        List inst= new ArrayList();
        try{
            Connection con= this.conection.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("ObtenerInstituciones"));
            System.out.println(ps.toString());
            ResultSet instituciones = ps.executeQuery();
            while(instituciones.next()){
                Institucion nueva= new Institucion();
                nueva.setCodigo(Integer.toString(instituciones.getInt("codigo")));
                nueva.setNombre(instituciones.getString("nombre"));
                nueva.setPais(instituciones.getString("pais"));
                inst.add(nueva);
            }
            System.out.println("Las instituciones se recuperaron exitosamente");
            return inst;
        }catch(Exception e){
            System.out.println("error al sacar las instituciones de la BD, Error= " + e.toString());
        }
        return null;
        
    }
    
    public int eliminarInstitucion(int codigo){ 
         try{
            Connection con= this.conection.getConnection();
            PreparedStatement ps = con.prepareStatement(BDConexion.getStatement("EliminarInstitucion"));
            System.out.println(ps.toString());
            ps.setInt(1,codigo);
            ps.executeUpdate();
             System.out.println("Institucion Eliminada exitosamente");
            return 1;
             }catch(SQLException e){
               System.out.println("Error al eliminar la Institucion");  
               return 2;
             }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package udea.drai.intercambio.dto;

/**
 *
 * @author Usuario
 */
public class Institucion {
    String codigo="";
    String nombre="";
    String pais="";
    public Institucion() {
    }
    public Institucion( String cod, String nom, String pais) {
        codigo=cod;
        nombre=nom;
        this.pais=pais;
    }

    public String getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getPais() {
        return pais;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
  
    
}

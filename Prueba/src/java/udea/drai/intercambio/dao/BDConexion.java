/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package udea.drai.intercambio.dao;

 import java.io.PrintStream;
 import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/*     */ import java.util.ResourceBundle;
/*     */ import java.util.logging.Level;
/*     */ import java.util.logging.Logger;
/*     */ 
//          clase que realiza la conexion a la base de datos.
/*     */ public class BDConexion
/*     */ {
/*     */   private static final String CONFIGURATION_FILE = "udea.drai.intercambio.dao.propiedadesBase";
/*     */   private static final String STATEMENTS_FILE = "udea.drai.intercambio.dao.statements";
/*  20 */   private static final ResourceBundle propiedades = ResourceBundle.getBundle("udea.drai.intercambio.dao.propiedadesBase");
/*  21 */   private static final ResourceBundle statements = ResourceBundle.getBundle("udea.drai.intercambio.dao.statements");
/*     */ 
/*  27 */   private Connection connection = null;
/*     */ 
/*     */   public BDConexion()
/*     */   {
            // toma todas las propiedades de la base de datos especificadas en el archivo propiedadesBase.properties
/*  32 */     String driver = getPropiedad("DriverBaseDeDatos");
/*  33 */     String url = getPropiedad("URLConexion") + getPropiedad("NombreBaseDeDatos");
/*  34 */     String user = getPropiedad("UsuarioBaseDeDatos");
/*  35 */     String password = getPropiedad("ContrasenaBaseDeDatos");
/*     */     try {
/*     */       try {
/*  38 */         Class.forName(driver);
/*     */       } catch (ClassNotFoundException ex) {
/*  40 */         Logger.getLogger(BDConexion.class.getName()).log(Level.SEVERE, null, ex);
/*     */       }
/*  42 */       this.connection = DriverManager.getConnection(url, user, password);
/*     */     }
/*     */     catch (SQLException ex)
/*     */     {
/*  49 */       Logger.getLogger(BDConexion.class.getName()).log(Level.SEVERE, null, ex);
/*     */     }
/*     */   }
/*     */ 
/*     */   public static String getPropiedad(String nombre)
/*     */   {
/*  61 */     String valor = propiedades.getString(nombre);
/*  62 */     return valor;
/*     */   }
/*     */ 
/*     */   public static String getStatement(String nombre)
/*     */   {
/*  73 */     String valor = statements.getString(nombre);
/*  74 */     return valor;
/*     */   }
/*     */ 
/*     */   public void closeConnection()
/*     */   {
/*     */     try
/*     */     {
/*  85 */       if (this.connection != null)
/*     */       {
/*  87 */         this.connection.close();
/*     */       }
/*     */     }
/*     */     catch (SQLException sqlException)
/*     */     {
/*  92 */       System.err.println(sqlException);
/*     */     }
/*     */   }
/*     */ 
/*     */   public Connection getConnection()
/*     */   {
/* 105 */     return this.connection;
/*     */   }
/*     */ }
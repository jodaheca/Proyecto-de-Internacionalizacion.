/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package udea.drai.intercambio.dao;

import java.sql.CallableStatement;
/*    */ import java.sql.Connection;
/*    */ import java.sql.Driver;
/*    */ import java.sql.DriverManager;
/*    */ import java.sql.PreparedStatement;
/*    */ import java.sql.SQLException;
/*    */ import java.sql.Statement;
/*    */ 
/*    */ public class BDConnection
/*    */ {
/*    */   private Connection conexion;
/*    */ 
/*    */   public BDConnection(String driver, String host, String usuario, String clave)
/*    */     throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException
/*    */   {
/* 22 */     DriverManager.registerDriver((Driver)Class.forName(driver).newInstance());
/* 23 */     this.conexion = DriverManager.getConnection(host, usuario, clave);
/*    */   }
/*    */ 
/*    */   public Statement getStatement()
/*    */     throws SQLException
/*    */   {
/* 32 */     return this.conexion.createStatement();
/*    */   }
/*    */ 
/*    */   public CallableStatement getCallableStatement(String sql)
/*    */     throws SQLException
/*    */   {
/* 42 */     return this.conexion.prepareCall(sql);
/*    */   }
/*    */ 
/*    */   public PreparedStatement getPreparedStatement(String sql)
/*    */     throws SQLException
/*    */   {
/* 52 */     return this.conexion.prepareStatement(sql);
/*    */   }
/*    */ 
/*    */   public void cerrarConexion()
/*    */     throws SQLException
/*    */   {
/* 60 */     if (this.conexion != null)
/* 61 */       this.conexion.close();
/*    */   }
/*    */ }

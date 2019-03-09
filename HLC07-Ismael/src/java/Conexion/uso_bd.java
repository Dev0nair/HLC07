/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import Tablas.Empleados;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author 3268i
 */
public class uso_bd {
    private Session sesion;
    
    public uso_bd(){
        try{
            this.sesion = HibernateUtil.getSessionFactory().openSession();    
        }catch(Exception e){
            
        }
        
    }
    
    public int existeEmple(String user, String pass){
        int id = -1;
        try{
            
            org.hibernate.Transaction tx = sesion.beginTransaction();
            Query q = sesion.createSQLQuery("select id from empleados where nombre = :p1 and password = :p2");
            q.setString("p1", user);
            q.setString("p2", pass);
            
            id = (int) q.list().get(0);
            
        }catch(Exception e){
            id = -1;   // si no existe, saltara la excepcion, lo cual pondremos su valor
        }
        
        return id; // devolvemos el ID
    }
    
}

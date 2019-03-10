/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.NewHibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author 3268i
 */
public class UsarBD {
    private Session sesion;
    
    public UsarBD(){
        try{
            this.sesion = NewHibernateUtil.getSessionFactory().openSession();    
        }catch(Exception e){
            
        }
        
    }
    
    public int existeEmple(String user, String pass){
        int id = -1;
        try{
            
            org.hibernate.Transaction tx = sesion.beginTransaction();
            Query q = sesion.createSQLQuery("select id from empleados where nombre = ? and password = ?");
            q.setString(0, user);
            
            q.setString(1, pass);
            
            id = (int) q.list().get(0);
            
        }catch(Exception e){
            id = -1;   // si no existe, saltara la excepcion, lo cual pondremos su valor
        } finally{
            System.err.println("ID Cogido: " + id);
        }
        
        sesion.close();
        
        return id; // devolvemos el ID
    }
    
    public List cogerTipoProductos(int id){

        org.hibernate.Transaction tx = sesion.beginTransaction();
        Query q = sesion.createSQLQuery("select * from Tipo_Productos where id_empleado = ?");
        q.setInteger(0, id);
        
        return q.list();
    }
}

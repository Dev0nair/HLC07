/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Empleados;
import Modelo.NewHibernateUtil;
import Modelo.Productos;
import Modelo.TipoProductos;
import java.util.Iterator;
import java.util.LinkedList;
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
            Query q = sesion.createQuery("from Empleados where Nombre = :user and Password = :pass");
            q.setString("user", user);
            q.setString("pass", pass);
            
            Empleados emple = (Empleados) q.uniqueResult();
            id = emple.getId();
            
        }catch(Exception e){
            id = -1;   // si no existe, saltara la excepcion, lo cual pondremos su valor
        } finally{
            System.err.println("ID Cogido: " + id);
        }
        
        sesion.close();
        
        return id; // devolvemos el ID
    }
    
    public LinkedList<TipoProductos> cogerTipoProductos(int id){
        LinkedList<TipoProductos> lista = new LinkedList();
        
        org.hibernate.Transaction tx = sesion.beginTransaction();
        Query q = sesion.createQuery("from TipoProductos where ID_EMPLEADO = :idtipo");
        q.setInteger("idtipo", id);
                
        Iterator<TipoProductos> it = ((List<TipoProductos>)q.list()).iterator();
        
        while(it.hasNext()){
            lista.add(it.next());
        }
        
        return lista;
    }
    
    public LinkedList<Productos> cogerProductos(int idtipo){
        LinkedList<Productos> lista = new LinkedList();
        
        org.hibernate.Transaction tx = sesion.beginTransaction();
        Query q = sesion.createQuery("from Productos where id_Producto = :idtipo");
        q.setInteger("idtipo", idtipo);
                
        Iterator<Productos> it = ((List<Productos>)q.list()).iterator();
        
        while(it.hasNext()){
            lista.add(it.next());
        }
        
        return lista;
    }
}

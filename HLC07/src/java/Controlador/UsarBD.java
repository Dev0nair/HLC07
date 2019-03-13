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
            
            sesion.flush();
        }catch(Exception e){
            id = -1;   // si no existe, saltara la excepcion, lo cual pondremos su valor
            cerrarConexion();
        }
        
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

    public int insertarNuevo(int idtipo, String nombre, float precio, String url) {
        int id = cogerUltimoID();
        
        Query q = sesion.createQuery("insert into Productos values (:id, :idtipo, :nomb, :precio, :url)");
        q.setInteger("id", id);
        q.setInteger("idtipo", idtipo);
        q.setString(":nomb", nombre);
        q.setFloat("precio", precio);
        q.setString("url", url);
        
        int n = q.executeUpdate();
        
        sesion.getTransaction().commit();
        
        System.err.println("Se ha introducido: " + id + " - " + idtipo + " " + nombre + " " + precio + " " + url);
        return n;
    }
    
    public void insertarNuevo(Productos pro){
        int id = cogerUltimoID();
        pro.setId(id);
        
        sesion.save(pro);
        sesion.getTransaction().commit();
        sesion.flush();
        
    }
    
    private int cogerUltimoID(){
        org.hibernate.Transaction tx = sesion.beginTransaction();
        Query q = sesion.createSQLQuery("select max(id)+1 from productos");
        int n;
        try{
            n = (int) q.list().get(0);
        }catch(Exception e){
            n = 0;
        }
        
        sesion.flush();
        
        return n;
    }
    
    public void cerrarConexion(){
        sesion.clear();
        sesion.disconnect();
        if (sesion.isOpen()) {
            sesion.close();
        }
    }
    
    public boolean isOpen(){
        return sesion.isOpen();
    }
}

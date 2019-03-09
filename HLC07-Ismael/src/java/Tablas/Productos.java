package Tablas;
// Generated 09-mar-2019 13:15:58 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Productos generated by hbm2java
 */
public class Productos  implements java.io.Serializable {


     private int id;
     private Integer idProducto;
     private String nombre;
     private Float precio;
     private Date fechaSalida;
     private String imagen;

    public Productos() {
    }

	
    public Productos(int id) {
        this.id = id;
    }
    public Productos(int id, Integer idProducto, String nombre, Float precio, Date fechaSalida, String imagen) {
       this.id = id;
       this.idProducto = idProducto;
       this.nombre = nombre;
       this.precio = precio;
       this.fechaSalida = fechaSalida;
       this.imagen = imagen;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Integer getIdProducto() {
        return this.idProducto;
    }
    
    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Float getPrecio() {
        return this.precio;
    }
    
    public void setPrecio(Float precio) {
        this.precio = precio;
    }
    public Date getFechaSalida() {
        return this.fechaSalida;
    }
    
    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }
    public String getImagen() {
        return this.imagen;
    }
    
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }




}



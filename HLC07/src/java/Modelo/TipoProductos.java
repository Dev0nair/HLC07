package Modelo;
// Generated 10-mar-2019 12:51:57 by Hibernate Tools 4.3.1



/**
 * TipoProductos generated by hbm2java
 */
public class TipoProductos  implements java.io.Serializable {


     private int id;
     private Integer idEmpleado;
     private String descripcion;

    public TipoProductos() {
    }

	
    public TipoProductos(int id) {
        this.id = id;
    }
    public TipoProductos(int id, Integer idEmpleado, String descripcion) {
       this.id = id;
       this.idEmpleado = idEmpleado;
       this.descripcion = descripcion;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Integer getIdEmpleado() {
        return this.idEmpleado;
    }
    
    public void setIdEmpleado(Integer idEmpleado) {
        this.idEmpleado = idEmpleado;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString(){
        return this.descripcion;
    }


}



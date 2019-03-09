<%-- 
    Document   : index
    Created on : 09-mar-2019, 12:07:47
    Author     : 3268i
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Tablas.TipoProductos"%>
<%@page import="Conexion.uso_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
    <head>
        <!-- Referencia a bootstrap css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

        <!-- Mi css -->
        <link rel="stylesheet" type="text/css" href="index.css">

        <title>Ismael GR - HLC07</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body class="bg-dark">

        <header class="main-header text-white pt-5">
            <div class="row d-flex h-100">
                <div class="col-sm-12 text-center justify-content-center">
                    <div class="datos">
                        <h1>HLC07</h1>
                        <p>Página web que hace uso de JSP, servlet e Hibernate, en una base de datos en Derby</p>
                    </div>
                </div>
            </div>
        </header>

        <hr/>
        
        <%
            //int id = Integer.parseInt(request.getParameter("usuario"));
            
            ArrayList<TipoProductos> lista = new ArrayList();
            lista.addAll(new uso_bd().cogerTipoProductos(1));
            
            String [] listaNombres = new String[lista.size()];
            
            for(int a = 0; a < lista.size(); a++){
                listaNombres[a] = lista.get(a).getDescripcion();
            }
            
            pageContext.setAttribute("lista", listaNombres);
        %>

        <section class="container text-center p-5">
            <div id="accordion">    
                <h1 class="text-center text-white">Tipos de productos</h1> 

                <c:forEach items="${lista}" var="tipop">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                ${tipop}
                                </button>
                            </h5>
                        </div>


                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body bg-dark">
                                <div class="container p-5 text-light">
                                    <h2 class="text-center ">Productos</h2>            
                                    <table class="table table-light table-striped table-hover text-center">
                                        <thead>
                                            <tr>
                                                <th>Jugador</th>
                                                <th>Ganadas</th>
                                                <th >Perdidas</th>
                                            </tr>
                                        </thead>
                                        <tbody>    
                                            <tr>
                                                <td>nombre1</td>
                                                <td>precio1</td>
                                                <td>precio1</td>
                                            </tr>    
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
                
            </div>
        </section>
        
              <!-- referencias a JS de bootstrap -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>

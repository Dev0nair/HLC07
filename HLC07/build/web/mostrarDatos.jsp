<%-- 
    Document   : index
    Created on : 09-mar-2019, 12:07:47
    Author     : 3268i
--%>

<%@page import="Modelo.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.TipoProductos"%>
<%@page import="Controlador.UsarBD"%>
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

        <script>
            function insertarNuevo(id, nombre) {

                document.getElementsByName("nid").value = id;
                
                document.getElementsByName("nnombre").value = prompt("Inserta el nombre");

                document.getElementsByName("nprecio").value = prompt("Inserta el precio");

                document.getElementsByName("nrul").value = prompt("Inserta la imagen");
                
                document.getElementById("formregistro").submit(); 

            }
        </script>
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

            LinkedList<TipoProductos> lista = new UsarBD().cogerTipoProductos(1);
            pageContext.setAttribute("listaTipos", lista);

            LinkedList<Productos> prods = new LinkedList();

            int actual = 0;
            pageContext.setAttribute("actual", actual);
        %>




        <section class="container text-center p-5">
            <div id="accordion">

                <h1 class="text-center text-white">Tipos de productos</h1> 

                <c:forEach items="${listaTipos}" var="i">                  
                    <div class="card">
                        <div class="card-header" id="heading${i.id}">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#${i.id}" aria-expanded="true" aria-controls="${i.id}">
                                    ${i.descripcion}
                                </button>
                            </h5>
                        </div>


                        <div id="${i.id}" class="collapse" aria-labelledby="${i.id}" data-parent="#accordion">
                            <div class="card-body bg-dark">
                                <div class="container p-5">
                                    <h2 class="text-center text-light">Productos</h2>            
                                    <table class="table table-light table-striped table-hover text-center text-dark">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Precio</th>
                                                <th>Imagen</th>
                                            </tr>
                                        </thead>
                                        <tbody>     
                                            <% prods = new UsarBD().cogerProductos(lista.get(actual).getId());
                                                pageContext.setAttribute("listaProds", prods); %>

                                            <c:forEach items="${listaProds}" var="a">
                                                <tr>
                                                    <td>${a.nombre}</td>
                                                    <td>${a.precio}</td>
                                                    <td><img src="${a.imagen}" width="60" height="60"></td>
                                                </tr>    
                                            </c:forEach>

                                            <% actual++;%>
                                        </tbody>
                                    </table>
                                    <form id="formregistro" action="ServletRegistro" method="POST">
                                        <input type="hidden" name="nnombre" value="">
                                        <input type="hidden" name="nnombre" value="">
                                        <input type="hidden" name="nprecio" value="">
                                        <input type="hidden" name="nurl" value="">
                                    </form>
                                    <button onclick="insertarNuevo(<%= actual - 1%>)" class="btn btn-primary">Insertar nuevo</button>
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
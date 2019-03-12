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
<%
    int iduser = 0;
    try {
        iduser = (Integer) request.getAttribute("idusuario");
    } catch (Exception e) {
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <!-- Referencia a bootstrap css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

        <!-- Mi css -->
        <link rel="stylesheet" type="text/css" href="design/index.css">

        <title>Ismael GR - HLC07</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kryogenix.org/code/browser/sorttable/sorttable.js"></script>
        <script>
            function insertarNuevo(id) {

                document.getElementById("nuevoid").value = id;

                document.getElementById("nuevonombre").value = prompt("Inserta el nombre");

                document.getElementById("nuevoprecio").value = prompt("Inserta el precio");

                document.getElementById("nuevaurl").value = prompt("Inserta la url de la imagen");

                document.getElementById("formregistro").submit();
            }

            function ordenar(n, tipo) {
                tipo -= 1;
                alert("ordenar " + n + " de " + tipo);

                var filas
                =
            }
        </script>
    </head>
    <body class="bg-dark">


        <%
            LinkedList<TipoProductos> lista = new UsarBD().cogerTipoProductos(iduser);
            pageContext.setAttribute("listaTipos", lista);

            LinkedList<Productos> prods = new LinkedList();

            int actual = 0;

        %>




        <section class="container text-center p-5">
            <h1 class="text-center text-white">Tipos de productos  
                <form method="POST" action="Cerrar">
                    <button type="submit" class="btn btn-danger">Cerrar Sesion</button>
                </form>                 

            </h1> 
        </section>

        <section class="row">
            <section class="col-3 ml-5">
                <c:forEach items="${listaTipos}" var="i">          
                <div class="card">
                    <div class="card-header" id="heading${i.id}">
                        <h5 class="mb-0">
                            <button class="btn btn-link" data-toggle="collapse" data-target="#${i.id}" aria-expanded="true" aria-controls="${i.id}">
                                ${i.descripcion}
                            </button>
                        </h5>
                    </div>
                </div>
                    
                </c:forEach>
            </section>           

            <section class="col-8">
                <div id="accordion">

                    <c:forEach items="${listaTipos}" var="i">                  
                        <div class="card">

                            <div id="${i.id}" class="collapse" aria-labelledby="${i.id}" data-parent="#accordion">
                                <div class="card-body bg-dark">
                                    <div class="container p-5">
                                        <h2 class="text-center text-light">Productos</h2>            
                                        <table class="table table-light table-striped table-hover text-center text-dark sortable">
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
                                                    <tr class="${i.id}">
                                                        <td>${a.nombre}</td>
                                                        <td>${a.precio}</td>
                                                        <td><img src="${a.imagen}" width="60" height="60"></td>
                                                    </tr>    
                                                </c:forEach>

                                                <% actual++;%>
                                            </tbody>
                                        </table>
                                        <form id="formregistro" action="ServletRegistro" method="POST">
                                            <input id="nuevoid" type="hidden" name="nid" value="id">
                                            <input id="nuevonombre" type="hidden" name="nnombre" value="nombre">
                                            <input id="nuevoprecio" type="hidden" name="nprecio" value="precio">
                                            <input id="nuevaurl" type="hidden" name="nurl" value="url">
                                        </form>
                                        <button onclick="insertarNuevo(${i.id})" class="btn btn-primary">Insertar nuevo</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
            </section> 
        </section>

        <!-- referencias a JS de bootstrap -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>

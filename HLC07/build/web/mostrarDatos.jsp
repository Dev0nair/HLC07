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
    // miramos si hemos entrado con la id de un usuario registrado
    int iduser = 0;
    try {
        iduser = (Integer) request.getSession().getAttribute("idusuario");
    } catch (Exception e) {
        response.sendRedirect("index.jsp");
    }

    // miramos si hemos recibido alguna información sobre alguna inserción de registro
    int metido;
    try {
        metido = (Integer) request.getAttribute("metido");
    } catch (Exception e) {
        metido = 0;
    }
%>
<html>
    <head>
        <!-- Referencia a bootstrap css -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- Referencia a JQuery para el toast y animaciones varias -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <!-- Mi css -->
        <link rel="stylesheet" type="text/css" href="design/index.css">

        <title>Ismael GR - HLC07</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kryogenix.org/code/browser/sorttable/sorttable.js"></script>
        <script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });

            function insertarNuevo(id) {
                document.getElementById("nuevoid").value = id;

                var pnombre = prompt("Inserta el nombre");

                if (pnombre != null) {
                    document.getElementById("nuevonombre").value = pnombre;

                    var pprecio = prompt("Inserta el precio");

                    if (pprecio != null) {
                        document.getElementById("nuevoprecio").value = pprecio;

                        var prul = prompt("Inserta la url de la imagen");

                        if (prul != null) {
                            document.getElementById("nuevaurl").value = prul;
                            document.getElementById("formregistro").submit();
                        }
                    }
                }

            }
        </script>
    </head>
    <body class="bg-dark">


        <%
            LinkedList<TipoProductos> lista = new UsarBD().cogerTipoProductos(iduser);
            pageContext.setAttribute("listaTipos", lista);

            LinkedList<Productos> prods = new LinkedList();

            int actual = 0;

            int metidoen = -1;
            String nombredonde = null;
            try {
                metidoen = Integer.parseInt((String) request.getSession().getAttribute("dondeNuevo"));
                nombredonde = lista.get(metidoen-1).getDescripcion();
            } catch (Exception e) {
                
            }

        %>



        <section class="container text-center py-5">
            <h1 class="text-center text-white">Tipos de productos  
                <form method="POST" action="Cerrar">
                    <button type="submit" class="btn btn-danger">Cerrar Sesion</button>
                </form>                 

            </h1> 
        </section>

        <div aria-live="polite" aria-atomic="true">

            <div style="position: absolute; top: 0; right: 0;">

                <div id="ok" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="false">
                    <div class="toast-header">
                        <strong class="mr-auto">Registro realizado.</strong>
                        <small class="text-muted">just now</small>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="toast-body">
                        El producto ' ${nombreNuevo} ' se ha insertado correctamente en <%= nombredonde %>.
                    </div>
                </div>
            </div>

            <div style="position: absolute; top: 0; right: 0;">

                <!-- Then put toasts within -->
                <div id="fail" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="false">
                    <div class="toast-header">
                        <strong class="mr-auto">Registro no realizado.</strong>
                        <small class="text-muted">Ahora</small>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="toast-body">
                        El producto ' ${nombreNuevo} ' no se ha podido insertar en <%= nombredonde %>.
                    </div>
                </div>
            </div>
        </div>



        <section class="row pl-1">

            <section id="lista" class="col-md-3">
                <c:forEach items="${listaTipos}" var="i">          
                    <div class="card">
                        <div class="card-header" id="heading${i.id}">
                            <h5 class="mb-0">
                                <button id="tableB${i.id}" class="btn btn-link" data-toggle="collapse" data-target="#${i.id}" aria-expanded="true" aria-controls="${i.id}">
                                    ${i.descripcion}
                                </button>
                            </h5>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${metido == 1}">
                    <script>
                        $('#ok').toast('show')
                    </script>
                </c:if>
                <c:if test="${metido == 2}">
                    <script>
                        $('#fail').toast('show')
                    </script>
                </c:if>
            </section>

            <section class="col-md-9">
                <input class="form-control" id="myInput" type="text" placeholder="Buscar por palabra">
                <div id="accordion">

                    <c:forEach items="${listaTipos}" var="i">                  

                        <div id="${i.id}" class="collapse" aria-labelledby="${i.id}" data-parent="#accordion">
                            <div class="card-body bg-dark">
                                <div class="container py-5 elemento">
                                    <h2 class="text-center text-light">Productos</h2>            
                                    <table class="table table-light table-striped table-hover text-center text-dark sortable">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Precio</th>
                                                <th>Imagen</th>
                                            </tr>
                                        </thead>
                                        <tbody id="myTable">     
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
                                        <input id="nuevoid" type="hidden" name="nid" value="">
                                        <input id="nuevonombre" type="hidden" name="nnombre" value="">
                                        <input id="nuevoprecio" type="hidden" name="nprecio" value="">
                                        <input id="nuevaurl" type="hidden" name="nurl" value="">
                                    </form>
                                    <button onclick="insertarNuevo(${i.id})" class="btn btn-primary">Insertar nuevo</button>
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

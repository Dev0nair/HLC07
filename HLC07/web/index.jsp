<%-- 
    Document   : index
    Created on : 09-mar-2019, 12:07:47
    Author     : 3268i
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    String resp = (String)request.getAttribute("respuesta");
    
    pageContext.setAttribute("resp", resp);
%>
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
        
        <section class="px-2 pt-5">
                
            <div class="container form text-white p-5">
                <h2 class="text-center">Entrar en la base de datos.</h2>
                <form method="POST" action="Servlet">
                    
                    <div class="form-group pt-2">
                        <label for="name">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" placeholder="Introducir nombre" name="nuevonombre">
                    </div>

                    <div class="form-group">
                        <label for="email">Contraseña: </label>
                        <input type="password" class="form-control" id="passwd" placeholder="Contraseña" name="nuevapass">
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Entrar</button>
                    
                    <c:if test="${resp == 'no'}"> <!-- Si no es null, significa que le hemos dicho que no hay usuario -->
                        <p>No se ha encontrado el usuario o contraseña incorrecta.</p>
                        <style>
                            input{
                                box-shadow: 0px 0px 5px 1px red;
                            }
                        </style>
                    </c:if>
                        
                </form>      
            </div>
        </section>

              <!-- referencias a JS de bootstrap -->
              <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>

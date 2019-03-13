<%-- 
    Document   : index
    Created on : 09-mar-2019, 12:07:47
    Author     : 3268i
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    String resp = (String) request.getSession().getAttribute("respuesta");
    request.getSession().invalidate();

    pageContext.setAttribute("resp", resp);
%>
<html>
    <head>
        <!--Bootsrap 4-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!--Fontawesome CDN - PARA LOS ICONOS DEL FORM-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!-- Mi css -->
        <link rel="stylesheet" type="text/css" href="design/index.css">

        <title>Ismael GR - HLC07</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body class="bg-dark">


        <header class="main-header text-white pt-5">
            <div class="row d-flex h-100">
                <div class="col-sm-12 text-center justify-content-center">
                    <div class="datos">
                        <h1>Práctica HLC07</h1>
                        <h3>Página web que hace uso de JSP, servlet e Hibernate, en una base de datos en Derby</h3>
                        <p>Por Ismael González. Finalizado día 10/02/2019.</p>
                    </div>
                </div>
            </div>
        </header>

        <hr/>

        <section class="container h-50 py-5">
            <div class="row justify-content-center align-items-center py-5">
                <form action="Servlet" method="post">
                    <div class="text-center" style="color: #fff;">
                        <h1>Log in</h1>
                    </div>
                    <div class="form-row justify-content-center">
                        <div class="col-7">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" placeholder="Username" name="nuevonombre">

                            </div>
                        </div>
                        <div class="col-7">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" placeholder="Password" name="nuevapass">
                            </div>
                        </div>
                    </div>
                    <div class="form-row justify-content-center">
                        <div class="col-7  my-1">
                            <button type="submit" class="btn btn-info btn-block" style="background-color: #36281d; color: #fff;">Entrar</button>
                        </div>
                    </div>
                    <c:if test="${resp == 'no'}">
                        <div class="form-row justify-content-center">
                            <div class="col-7  my-1">
                                <div class="alert alert-danger">Usuario no encontrado o contraseña incorrecta!</div>
                            </div>
                        </div>

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

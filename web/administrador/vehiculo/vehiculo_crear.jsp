<%-- 
    Document   : vehiculo_crear
    Created on : 22-07-2017, 2:46:01
    Author     : Galmier
--%>

<%@page import="Acceso.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("conectado")==null || sesion.getAttribute("conectado").equals("false") || sesion.getAttribute("conectado").equals("true-invitado")){
        response.sendRedirect("../../index.jsp");
    }
    else{
        
    }
%>
<%
    Conexion conexion=new Conexion();
%>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../../Resources/css/materialize.min.css"  media="screen,projection"/>
        <link rel="stylesheet" type="text/css" href="../../Resources/css/style.css">
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Inicio</title>
    </head>
    <body>
        <main>
            <!--Barra Superior-->
            <div class="nav-wrapper">    
                <nav class="teal">
                    <div class="navbar-fixed">					
                        <ul id="nav-mobile" class="right hide-on-med-and-down">
                            <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Consultar<i class="material-icons right">arrow_drop_down</i><i class="material-icons left">search</i></a></li>
                        </ul>
                        <!--Componentes menu Consultar-->
                        <ul id="dropdown1" class="dropdown-content">
                            <li><a href="#!">Gerencia</a></li>
                            <li class="divider"></li>
                            <li><a href="#!">Choferes</a></li>
                            <li class="divider"></li>
                            <li><a href="#!">Obras</a></li>
                        </ul>
                        <button type="button" id="w11" class="sidenav-toggle btn teal lighten-1" data-activates="slide-out" style="margin-left: 60px">Menu</button>
                    </div>  
                    <!--Barra Lateral con los Menus-->
                    <ul id="slide-out" class="side-nav">
                        <li>
                            <div class="user-view">
                                <div>
                                    <img style="width: 250px" src="../../img/logo.png">
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li><a href="../inicio.jsp"><i class="material-icons">home</i>Inicio</a></li>
                        <li><a href="vehiculo_crear.jsp"><i class="material-icons">person</i>Ingresar Vehiculo</a></li>
                        <li><a href="vehiculo_editar.jsp"><i class="material-icons">settings</i>Editar Vehiculo</a></li>
                        <li><a href="#!"><i class="material-icons">cancel</i>Eliminar Vehiculo</a></li>
                        <li><a href="#!"><i class="material-icons">power_settings_new</i>Log out</a></li>
                    </ul>        
                </nav>
            </div>
            <div class="section"></div>
            <!--FORMULARIO-->
            <div class="row container">
                <form class="col s12" method="post" action="../../ServletVehiculo?accion=registrar">
                    <div class="row">
                        <div class="col s12 l6">
                            <div class="card z-depth-4">
                                <div class="class card-content">
                                    <div class="row">			
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">tab</i>
                                            <input id="icon_prefix" type="text" class="validate" name="codigo">
                                            <label for="icon_prefix">Codigo</label>
                                        </div>
                                    </div>	
                                    <div class="row">			
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">drive_eta</i>
                                            <input id="icon_prefix" type="text" class="validate" name="patente">
                                            <label for="icon_prefix">Patente</label>
                                        </div>
                                    </div>                                   
                                </div>		
                            </div>
                        </div>
                        <div class="col s12 l6">
                            <div class="card z-depth-4">
                                <div class="class card-content">
                                    <div class="row">						
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">library_books</i>
                                            <input id="icon_prefix" type="text" class="validate" name="marca">
                                            <label for="icon_prefix">Marca</label>
                                        </div>
                                    </div> 
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">library_books</i>
                                            <input id="icon_prefix" type="text" class="validate" name="modelo">
                                            <label for="icon_prefix">Modelo</label>
                                        </div>
                                    </div>
                                </div>		
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <select name="vehiculo_id">
                                <% conexion.setSQL("select * from tipo_vehiculos");
                                   while(conexion.getRs().next()){
                                %>
                                <option value="<% out.println(conexion.getRs().getString("tipo_vehiculo_id")); %>"><% out.println(conexion.getRs().getString("tipo")); %></option>
                                <% } %>
                            </select>
                            <label>Codigo Vehiculo</label>
                        </div>
                        <div class="input-field col s6">
                            <select name="obra_id">
                                <% conexion.setSQL("select * from estado_vehiculos");
                                   while(conexion.getRs().next()){
                                %>
                                <option value="<% out.println(conexion.getRs().getString("estado_id")); %>"><% out.println(conexion.getRs().getString("estado")); %></option>
                                <% } %>
                            </select>
                            <label>Obra</label>
                        </div>
                        <div class="input-field col s6">
                            <select name="empresa_id">
                                <% conexion.setSQL("select * from empresas");
                                   while(conexion.getRs().next()){
                                %>
                                <option value="<% out.println(conexion.getRs().getString("empresa_id")); %>"><% out.println(conexion.getRs().getString("nombre_empresa")); %></option>
                                <% } %>
                            </select>
                            <label>Empresa</label>
                        </div>    
                        <div class="input-field col s6">
                            <select name="obra_id">
                                <% conexion.setSQL("select * from obras");
                                   while(conexion.getRs().next()){
                                %>
                                <option value="<% out.println(conexion.getRs().getString("obra_id")); %>"><% out.println(conexion.getRs().getString("nombre_obra")); %></option>
                                <% } %>
                            </select>
                            <label>Obra</label>
                        </div>     
                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Crear chofer
                        <i class="material-icons right">send</i>
                    </button>
                </form>
        </main>
        <!--PIE DE PAGINA-->
        <footer class="page-footer blue-grey darken-4">
            <div class="footer-copyright">
                <div class="container">
                    © 2017 Desarrollado por Pablo Tomey, Galmier mancilla				
                </div>
            </div>
        </footer>
    </body>
</html>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../../Resources/js/materialize.min.js"></script>
<!--Script que activa los Select-->
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<!--Script que activa el sidebar-->
<script>
    $(".sidenav-toggle").sideNav();
</script>
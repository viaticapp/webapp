<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="uk-height-1-1">
    <head>
        <title>Usuarios</title>
        <meta charset="utf-8">
        <meta name="theme-color" content="#ffffff">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="static/resources/icons/fd16.png">
        <link rel="apple-touch-icon-precomposed" href="static/resources/icons/apple-touch-icon.png">
        <link rel="stylesheet" href="static/css/uikit.min.css" />
        <link rel="stylesheet" href="static/css/local-fonts.css" />
        <link rel="stylesheet" href="static/css/style.css" />
        <script src="static/js/jquery.min.js"></script>
        <script src="static/js/uikit.min.js"></script>
        <script src="static/js/uikit-icons.min.js"></script>
    </head>
    <body class="uk-height-1-1">
        <%@include file="menu.jsp" %>
        <div class="uk-container uk-height-viewport">
            <nav class="uk-navbar-container" uk-navbar>
                <div class="uk-navbar-left uk-padding-small">
                    <span class="uk-navbar-item uk-logo uk-heading-bullet">Usuarios</span>
                </div>
            </nav>
            <div class="uk-container uk-overflow-auto">
                <table class="uk-table uk-table-responsive uk-table-divider">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Email</th>
                            <th>Usuario</th>
                            <th></th>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.email}</td>
                            <td>${user.username}</td>
                            <td>
                                <a uk-icon="more-vertical"></a>
                                <div uk-dropdown="mode: click">
                                    <ul class="uk-nav uk-dropdown-nav">
                                        <li><a href="<c:url value='/edit-user-${user.username}' />">Editar</a></li>
                                        <li><a href="#modal-example" uk-toggle>Eliminar</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>

                        <!-- This is the modal -->
                        <div id="modal-example" uk-modal>
                            <div class="uk-modal-dialog uk-modal-body">
                                <h2 class="uk-modal-title">Advertencia!</h2>
                                <p>¿Realmente deseas eliminar al usuario?</p>
                                <p class="uk-text-right">
                                    <a class="uk-button uk-button-default uk-modal-close">Cancelar</a>
                                    <a href="<c:url value='/delete-user-${user.username}' />" class="uk-button uk-button-primary">Eliminar</a>
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%@include file="offcanvas_menu.jsp" %>
        <%@include file="footer.jsp" %>
    </body>
</html>

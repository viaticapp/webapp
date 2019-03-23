<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Nuevo Usuario</title>
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
    <body class="uk-height-viewport">
        <%@include file="menu.jsp" %>
        <div class="uk-container uk-height-viewport">
            <nav class="uk-navbar-container" uk-navbar>
                <div class="uk-navbar-left uk-padding-small">
                    <c:choose>
                        <c:when test="${edit}">
                            <span class="uk-navbar-item uk-logo uk-heading-bullet">Editar usuario</span>
                        </c:when>
                        <c:otherwise>
                            <span class="uk-navbar-item uk-logo uk-heading-bullet">Nuevo usuario</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </nav>
            <div class="uk-container uk-width-1-2">
                <form:form method="POST" modelAttribute="user" id="userForm">
                    <form:input type="hidden" path="id" id="id"/>

                    <div>
                        <div>
                            <label class="uk-form-label" for="firstName">Nombre</label>
                            <div class="uk-form-controls">
                                <form:input type="text" path="firstName" id="firstName" class="uk-input"/>
                                <div>
                                    <form:errors path="firstName" class="help-inline"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div>
                            <label class="uk-form-label" for="lastName">Apellido</label>
                            <div class="uk-form-controls">
                                <form:input type="text" path="lastName" id="lastName" class="uk-input"/>
                                <div>
                                    <form:errors path="lastName"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div>
                            <label class="uk-form-label" for="user_name">Usuario</label>
                            <div class="uk-form-controls">
                                <c:choose>
                                    <c:when test="${edit}">
                                        <form:input type="text" path="username" id="username" disabled="true" class="uk-input"/>
                                    </c:when>
                                    <c:otherwise>
                                        <form:input type="text" path="username" id="username" class="uk-input"/>
                                        <div>
                                            <form:errors path="username"/>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="uk-form-controls">
                            <label class="uk-form-label" for="password">Contraseña</label>
                            <div>
                                <form:input type="password" path="password" id="password" class="uk-input"/>
                                <div>
                                    <form:errors path="password"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="uk-form-controls">
                            <label class="uk-form-label" for="email">Email</label>
                            <div>
                                <form:input type="text" path="email" id="email" class="uk-input"/>
                                <div>
                                    <form:errors path="email"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="uk-form-controls">
                            <label class="uk-form-label" for="userProfiles">Tipo de usuario</label>
                            <div >
                                <form:select path="userProfiles" items="${roles}" multiple="false" itemValue="id" itemLabel="type" class="uk-select" />
                                <div>
                                    <form:errors path="userProfiles"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="uk-form-controls">                
                            <div class="uk-align-right uk-margin-top">
                                <c:choose>
                                    <c:when test="${edit}">
                                        <a href="users" class="uk-button uk-button-default uk-modal-close" tabindex="7" >Cancelar</a>
                                    </c:when>
                                </c:choose>
                                <input class="uk-button uk-button-primary" type="submit" value="Guardar"/>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
        <%@include file="offcanvas_menu.jsp" %>
        <%@include file="footer.jsp" %>
    </body>
    <script>document.getElementById("userForm").reset();</script>
</html>

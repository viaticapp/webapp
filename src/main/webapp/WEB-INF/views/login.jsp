<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="uk-height-1-1">
    <head>
        <title>Iniciar sesión</title>
        <meta charset="utf-8">
        <meta name="theme-color" content="#171D1D">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="static/resources/icons/viaticapp_icon.png">
        <link rel="apple-touch-icon-precomposed" href="static/icons/viaticapp-touch-icon.png">
        <link rel="stylesheet" href="static/css/uikit.min.css" />
        <link rel="stylesheet" href="static/css/local-fonts.css" />
        <link rel="stylesheet" href="static/css/style.css" />
        <script src="static/js/jquery.min.js"></script>
        <script src="static/js/uikit.min.js"></script>
        <script src="static/js/uikit-icons.min.js"></script>
        <style>
            .uk-button-primary {
                background-color: #2BC7ED !important;
            }
        </style>
    </head>
    <body>
        <div class="uk-flex uk-flex-center uk-flex-middle uk-height-viewport" style="background-color: #171D1D;">

            <div class="uk-width-medium uk-padding-small" style="margin-top: -100px;">
                <c:url var="loginUrl" value="/login" />
                <form action="${loginUrl}" method="post" class="form-horizontal">
                    <fieldset class="uk-fieldset" style="text-align: center;">
                        <legend class="uk-legend uk-text-center"><img src="static/images/viaticapp_logo.svg" width="200"></legend>
                        <h3 class="uk-light">ViaticApp<br>Control de gastos</h3>
                        <div class="uk-margin">
                            <div class="uk-inline uk-width-1-1">
                                <span class="uk-form-icon uk-form-icon-flip" data-uk-icon="icon: user"></span>
                                <input type="text" class="uk-input uk-form-medium" id="username" name="username" placeholder="Usuario" maxlength="25" required autofocus>
                            </div>
                        </div>
                        <div class="uk-margin">
                            <div class="uk-inline uk-width-1-1">
                                <span class="uk-form-icon uk-form-icon-flip" data-uk-icon="icon: lock"></span>
                                <input type="password" class="uk-input uk-form-medium" id="password" name="password" placeholder="Contraseña" required>
                            </div>
                        </div>
                        <div class="uk-margin uk-hidden">
                            <div class="uk-inline uk-width-1-1">
                                <div>
                                    <label><input class="uk-checkbox" type="checkbox" id="rememberme" name="remember-me"> Recordarme</label>  
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />

                        <div class="uk-margin">
                            <input type="submit" class="uk-button uk-button-primary uk-button-large uk-width-1-1" value="Entrar">
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <script>
        <c:if test="${param.error != null}">
        UIkit.notification({
            message: 'Usuario o contraseña incorrectos',
            status: 'warning',
            pos: 'top-center',
            timeout: 2000
        });
        </c:if>
        <c:if test="${param.logout != null}">
        UIkit.notification({
            message: 'Sesión cerrada exitosamente!',
            status: 'primary',
            pos: 'top-center',
            timeout: 2000
        });
        </c:if>
    </script>
</html>
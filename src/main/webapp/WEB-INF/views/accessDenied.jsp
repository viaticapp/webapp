<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="uk-height-1-1">
    <head>
        <title>Access Denied</title>
        <meta name="theme-color" content="#ffffff">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="<c:url value='static/resource/icons/fd16.png'/>">
        <link rel="apple-touch-icon-precomposed" href="<c:url value='static/resource/icons/apple-touch-icon.png'/>">
        <link rel="stylesheet" href="<c:url value='static/css/uikit.min.css'/>" />
        <link href="https://fonts.googleapis.com/css?family=Space+Mono:400,400i,700,700i" rel="stylesheet">
        <script src="<c:url value='static/js/jquery.min.js'/>"></script>
        <script src="<c:url value='static/js/uikit.min.js'/>"></script>
        <script src="<c:url value='static/js/uikit-icons.min.js'/>"></script>
        <link rel="stylesheet" href="<c:url value='static/css/style.css'/>" />
    </head>
    <body class="uk-height-1-1">
        <div class="uk-flex uk-flex-center uk-flex-middle uk-background-default uk-height-viewport">
            <div class="uk-width-large uk-padding-small">
                <legend class="uk-legend uk-text-center"><img src="static/resources/images/oops.svg"></legend>
                <h2 class="uk-text-primary">Acceso Denegado</h2>
                <p>
                    Lo sentimos, no tienes permisos suficientes para ir al sitio.
                </p>
                <p>
                    Puedes volver desde el siguiente <a class="uk-text-primary" href="login">enlace</a>.
                </p>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
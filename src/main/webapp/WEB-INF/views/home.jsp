<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="uk-overflow-hidden">
    <head>
        <title>Inicio</title>
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
        <style>
            body {
                background-color: #ededed;
            }
            .uk-navbar-container:not(.uk-navbar-transparent) {
                background: #171D1D;
            }
            .uk-background-default {
                background-color: #171D1D;
            }
            .uk-dropdown-nav .uk-nav-header {
                color: #fff;
            }
        </style>
    </head>
    <body class="uk-height-viewport">
        <%@include file="menu.jsp" %>
        <!-- MAIN CONTENT CONTAINER -->
        <div class="uk-container">
            <div class="uk-padding-small uk-align-left">
                <span class="uk-navbar-item uk-logo uk-heading-bullet">Bienvenido ${loggedinuser.firstName}</span>
            </div>
        </div>
        <%@include file="offcanvas_menu.jsp" %>
        <%@include file="footer.jsp" %>
        <c:if test="${param.error != null}">
            <script>
                UIkit.notification({
                    message: '${param.error}',
                    status: 'danger',
                    pos: 'top-center',
                    timeout: 2000
                });
            </script>
        </c:if>

    </body>
</html>

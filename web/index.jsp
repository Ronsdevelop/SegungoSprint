
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="/struts/xhtml/styles.css" type="text/css"/>
        <script src="/struts/utils.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/style-index.css" />
        <title>Las Americas Hotel</title>
    </head>
    <body>
        <div class="outer">
            <div class="middle">
                <div class="inner">
                    <table>
                        <tr>
                            <td>
                                <img src="image/logo.png" alt="">
                                <div class="subtitulo">
                                    Hotel Restaurant
                                </div>
                                <p class="subtitulo2">
                                    Por favor identif&iacute;quese
                                </p> <form id="login" name="login" action="IniciarSesionServlet" method="post">
                                    <table class="wwFormTable">
                                        <div>
                                            <div>
                                                <div class="">
                                                    <tr>
                                                        <td class="tdLabel"><label for="login_usuariologueado_codigo" class="label">Usuario:</label></td>
                                                        <td
                                                            ><input type="text" name="uss" value="" id="login_usuariologueado_codigo"/></td>
                                                    </tr>

                                                </div>
                                                <div class="">
                                                    <tr>
                                                        <td class="tdLabel"><label for="login_usuariologueado_contrasena" class="label">Contraseña:</label></td>
                                                        <td
                                                            ><input type="password" name="pass" id="login_usuariologueado_contrasena"/></td>
                                                    </tr>

                                                </div>
                                            </div>

                                            <div class="">
                                                <div class="">
                                                    <tr>
                                                        <td colspan="2"><div align="right"><input type="submit" id="login_0" value="Ingresar" class="w8-button3 red"/>
                                                            </div></td>
                                                    </tr>
                                                </div>
                                            </div>
                                        </div>
                                    </table>
                                
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="/idioma.action?request_locale=es"><img src="imagenes/es.png" alt=""></a> <a href="/idioma.action?request_locale=en"><img src="imagenes/en.png" alt=""></a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </body>
</html>

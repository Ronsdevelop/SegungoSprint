
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


        <link rel="stylesheet" href="css/style-index.css" />
        <title>Las Americas Hotel</title>
    </head>
    <body> <!-- #353A3E -->
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
                                    <table >
                                        <tr>
                                            <td  ><label for="login_usuariologueado_codigo" class="label">Usuario:</label></td>
                                            <td
                                                ><input type="text" name="uss" value="" id="login_usuariologueado_codigo"/></td>
                                        </tr>

                                   
                                            <tr>
                                                <td  ><label for="login_usuariologueado_contrasena" class="label">Contraseña:</label></td>
                                                <td
                                                    ><input type="password" name="pass" id="login_usuariologueado_contrasena"/></td>
                                            </tr>

                                            <tr>
                                                <td colspan="2"><div align="right"><input type="submit" id="login_0" value="Ingresar" class="w8-button3 red"/>
                                                    </div></td>
                                            </tr>

                                    </table>

                                </form>
                            </td>
                        </tr>
                     
                    </table>
                </div>
            </div>
        </div>

    </body>
</html>

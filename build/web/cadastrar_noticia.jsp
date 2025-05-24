<%-- 
    Document   : cadastrar_noticia
    Created on : 05/11/2020, 12:21:59
    Author     : Danilo Miranda
--%>

<%
    boolean logado = session.getAttribute("email") == null ? false : true;
%>

<% if (!logado) {%>
<script>
    window.location.href = "http://localhost:8080/Login_2/login.jsp";
</script>
<% }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <title>Portal de Notícias - Cadastro Notícia</title>

        <style>
            textarea {
                resize: none;
            }
        </style>
    </head>
    <body>
        <h1>Cadastrar notícia</h1>

        <form action="ServletCadastrarNoticia" method="POST">
            <div>
                <input type="hidden" value="<%= session.getAttribute("id")%>" name="idUsuario">
            </div>

            <div>
                <label for="noticia">Notícia</label>
                <div>
                    <textarea name="noticia" id="noticia" rows="5"></textarea>
                </div>
            </div>

            <div>
                <label for="valor">Valor</label>
                <input type="text" name="valor" id="valor">
            </div>
            
            <button type="submit">Cadastrar</button>
        </form>
    </body>
</html>

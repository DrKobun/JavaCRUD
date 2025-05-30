<%-- 
    Document   : cadastrar_noticia
    Created on : 05/11/2020, 12:21:59
    Author     : Dr Kobun
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
           <title>Cadatro de Pacientes</title>

        <style>
            textarea {
                resize: none;
            }
        </style>
    </head>
    <body>
        <h1>Cadastrar Paciente</h1>

        <form action="ServletCadastrarPaciente" method="POST">
            <div>
                <input type="hidden" value="<%= session.getAttribute("id")%>" name="idUsuario">
            </div>

            <div>
                <label for="nome">Nome</label>
                <div>
                    <input name="nome" id="nome" rows="5"></input>
                </div>
            </div>

            <div>
                <label for="idade">Idade</label>
                <input type="number" name="idade" id="idade">
            </div>
            
            <div>
                <label for="idade">CPF</label>
                <input type="text" name="cpf" id="cpf">
            </div>
            
            <div>
                <label for="telefone">Telefone</label>
                <input type="text" name="telefone" id="telefone">
            </div>
            
            <div>
                <label for="idade">Data Nascimento</label>
                <input type="text" name="dataNascimento" id="dataNascimento">
            </div>
            <button type="submit">Cadastrar</button>
        </form>
    </body>
</html>

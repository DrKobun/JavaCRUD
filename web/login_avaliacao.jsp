<%-- 
    Document   : login_avaliacao
    Created on : 29 de mai. de 2025, 22:12:20
    Author     : Wally
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login do Paciente</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .login-form {
            background-color: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            width: 320px;
        }
        .login-form h2 {
            margin-bottom: 20px;
            font-size: 20px;
            text-align: center;
        }
        .login-form input {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login-form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .login-form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form class="login-form" method="post" action="ServletLoginAvaliacao">
        <h2>Login do Paciente</h2>
        
        <label for="nomePaciente">Nome do Paciente:</label>
        <input type="text" id="nomePaciente" name="nomePaciente" required>

        <label for="idAtendimento">ID do Atendimento:</label>
        <input type="number" id="idAtendimento" name="idAtendimento" required>

        <input type="submit" value="Entrar">
    </form>
</body>
</html>


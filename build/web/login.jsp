<%-- 
    Document   : login
    Created on : 05/11/2020, 10:31:40
    Author     : Danilo Miranda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Portal de Notícias - Login</title>
    <link rel="stylesheet" href="assets/css/style.css" />
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
      rel="stylesheet"
    />
  </head>

  <body>
      <img class="wave" src="assets/img/wave5.png" />
    <div class="container">
      <div class="img">
        <img src="assets/img/authentication.svg" />
      </div>
      <div class="login-container">
        <form action="ServletLogin" method="POST">
          <img class="avatar" src="assets/img/avatar.svg" />
          <h2>Login</h2>
          <p>Bem-vindo de volta !</p>
          <div class="input-div one">
            <div class="i">
              <i class="fas fa-user"></i>
            </div>
            <div>
              <h5>E-mail</h5>
              <input class="input" type="text" name="email" id="email" required> 
            </div>
          </div>
          <div class="input-div two">
            <div class="i">
              <i class="fas fa-key"></i>
            </div>
            <div>
              <h5>Senha</h5>
              <input class="input" type="password" name="senha" id="senha" required>
            </div>
          </div>
          <input type="submit" class="btn" value="Entrar" />
          <div class="others">
            <hr />
            <p>OU</p>
            <hr />
          </div>

          <div class="account">
            <p>Ainda não possui conta ?</p>
            <a href="cadastro.jsp">Cadastre-se</a>
          </div>
        </form>
      </div>
    </div>

      <script type="text/javascript" src="assets/js/main.js"></script>
  </body>
</html>

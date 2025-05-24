<%-- 
    Document   : home
    Created on : 05/11/2020, 11:25:08
    Author     : Danilo Miranda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.controle.Noticia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.NoticiasDAO"%>
<%@page import="java.text.DecimalFormat"%>

<%
    boolean logado = session.getAttribute("email") == null ? false : true;
    String idUsuarioLogado = String.valueOf(session.getAttribute("id"));
%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <!-- FontAwesome -->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

        <title>Portal de Notícias - Home </title>

        <style>
            a {
                text-decoration: none !important;
            }

            textarea {
                resize: none;
            }

            .btn-close {
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="login.jsp">
                    <i class="far fa-newspaper fa-2x"></i>
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <% if (logado) {%>
                            <a class="nav-link" href="ServeletDeslogar">Sair</a>
                            <%} else {%>
                            <a class="nav-link" href="loginPaciente.jsp">Entrar</a>
                            <%} %>
                        </li>
                    </ul>
                </div> 
            </div>
        </nav>

        <div class="container vh-100">
            <% if (logado) {%>
            <div class="mt-5 mb-4 d-flex flex-column">

                <p class="alert alert-success" role="alert"> Bem vindo!  <strong><%=session.getAttribute("email")%></strong></p>

                <a href="#" data-toggle="modal" data-target="#modalCadastrar"  class="btn btn-primary ml-auto">Cadastrar notícia</a>
            </div>
            <% } else {%>


            <div class="my-4">
                <div class="alert alert-danger" role="alert">
                    Autentique-se para gerenciar as suas notícias !
                </div>

            </div>
            <% }%>


            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Notícia <i class="fas fa-rss"></i></th>
                        <th scope="col" class="text-center">Valor <i class="fas fa-hand-holding-usd"></i></th>
                        <th scope="col" class="text-center">Data <i class="far fa-calendar-alt"></i></th>
                        <th scope="col" class="text-center">Editar <i class="fas fa-edit"></i></th>
                    </tr>
                </thead>

                <%
                    NoticiasDAO noticiasDAO = new NoticiasDAO();
                    Noticia noticia = new Noticia();

                    ArrayList<Noticia> listaNoticias = noticiasDAO.pesquisarTudo();
                    DecimalFormat df = new DecimalFormat("#,##0.00");

                    for (int i = 0; i < listaNoticias.size(); i++) {
                        noticia = listaNoticias.get(i);
                %>

                <tr>
                    <td class="align-middle"><%=noticia.getNoticia()%></td>
                    <td class="text-center align-middle"><%=df.format(noticia.getValor())%></td>
                    <td class="text-center align-middle"><%=noticia.getDataNoticia()%></td>

                    <td class="text-center align-middle">
                        <% if (String.valueOf(noticia.getIdUsuario()).equals(idUsuarioLogado)) {%>
                        <a href="#" class="btn btn-light"
                           onclick="editarNoticia(this, '<%=noticia.getCodigo()%>')"
                           data-toggle="tooltip" data-placement="top" title="Editar">
                            <i class="fas fa-pen-nib"></i>
                        </a>

                        <a href="ServletDeletarNoticia?codigo=<%=noticia.getCodigo()%>"
                           onclick="return confirm('Tem certeza que deseja apagar esse registro? Esta ação não poderá ser desfeita.')"
                           class="btn btn-outline-danger"
                           data-toggle="tooltip" data-placement="top" title="Apagar">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                        <%} else {%>
                        <a href="#" class="btn btn-light"
                           data-toggle="tooltip" data-placement="top" title="Bloqueado">
                            <i class="fas fa-ban"></i>
                        </a>
                        <% }%>
                    </td>
                    </td>
                </tr>

                <%}
                %>
            </table>
        </div>

        <!-- Modal Editar  -->
        <div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="modalEditar" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-light" style="border-bottom: none;">
                        <h5 class="modal-title" id="exampleModalLongTitle">
                            <i class="fas fa-cube mr-2"></i>Editar notícia
                        </h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form method="POST" action="ServletEditarNoticia">
                            <div class="form-group mt-3">
                                <label for="noticia">Notícia</label>
                                <textarea class="form-control" name="noticia" rows="10" id="noticia"></textarea>
                            </div>

                            <div class="form-group mt-3">
                                <label for="valor">Valor</label>
                                <input class="form-control" type="text" name="valor" id="valor">
                            </div>

                            <div class="form-group">
                                <input type="hidden" name="codigo" id="codigo" />
                            </div>

                            <div class="form-group mt-5 d-flex justify-content-end">
                                <a href="#" class="btn-close text-dark mr-3 mt-2" data-dismiss="modal">
                                    Fechar
                                </a>

                                <button type="submit" class="btn btn-light">Salvar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal Cadastrar -->

        <div class="modal fade" id="modalCadastrar" tabindex="-1" role="dialog" aria-labelledby="modalCadastrar" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-light" style="border-bottom: none;">
                        <h5 class="modal-title" id="exampleModalLongTitle">
                            <i class="fas fa-cube mr-2"></i>Cadastrar Notícia
                        </h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form method="POST" action="ServletCadastrarNoticia">
                            <div class="form-group mt-3">
                                <div>
                                    <input type="hidden" value="<%= session.getAttribute("id")%>" name="idUsuario">
                                </div>
                                <label for="noticia">Notícia</label>
                                <textarea class="form-control" name="noticia" rows="10" id="noticia"></textarea>
                            </div>

                            <div class="form-group mt-3">
                                <label for="valor">Valor</label>
                                <input class="form-control" type="text" name="valor" id="valor">
                            </div>


                            <div class="form-group mt-5 d-flex justify-content-end">
                                <a href="#" class="btn-close text-dark mr-3 mt-2" data-dismiss="modal">
                                    Fechar
                                </a>

                                <button type="submit" class="btn btn-light">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>























    </body>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- jQuery Mask -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js" integrity="sha512-pHVGpX7F/27yZ0ISY+VVjyULApbDlD0/X0rgGbTqCE7WFW5MezNTWG/dnhtbBuICzsd0WQPgpE4REBLv+UqChw==" crossorigin="anonymous"></script>

    <script>
                               $('#valor').mask('#.##0,00', {reverse: true});

                               (function () {
                                   $("[data-toggle='tooltip']").tooltip();
                               })();

                               function editarNoticia(element, codigo) {
                                   const tr = $(element).closest("tr");

                                   const noticia = $(tr).find("td")[0];
                                   const valor = $(tr).find("td")[1];

                                   $("#codigo").val(codigo)
                                   $("#noticia").val(noticia.innerText);
                                   $("#valor").val(valor.innerText);

                                   $("#modalEditar").modal("show");
                               }
    </script>
</html>

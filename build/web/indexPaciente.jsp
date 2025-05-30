<%-- 
    Document   : home
    Created on : 05/11/2020, 11:25:08
    Author     : Danilo Miranda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.controle.Paciente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.PacienteDAO"%>
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

        <title>PACIENTES CADASTRADOS - D'OR</title>

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
        <nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
            <div class="container">
                <a class="navbar-brand" href="#">Clínica</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="indexPaciente.jsp">Cadastro de Paciente</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="triagem_paciente.jsp">Triagem <span class="sr-only">(atual)</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container vh-100">
            <% if (logado) {%>
            <div class="mt-5 mb-4 d-flex flex-column">

                <p class="alert alert-success" role="alert"> Bem vindo!  <strong><%=session.getAttribute("email")%></strong></p>

                <a href="#" data-toggle="modal" data-target="#modalCadastrar"  class="btn btn-primary ml-auto">Cadastrar Paciente</a>
            </div>
            <% } else {%>


            <div class="my-4">
                <div class="alert alert-danger" role="alert">
                    Autentique-se para gerenciar Pacientes !
                    <a href="loginPaciente.jsp">LOGIN</a>
                </div>

            </div>
            <% }%>
            <form class="form-inline mb-3" method="get" action="indexPaciente.jsp">
                <input class="form-control mr-sm-2" type="search" name="pesquisa" placeholder="Buscar por nome" aria-label="Pesquisar" value="<%= request.getParameter("pesquisa") != null ? request.getParameter("pesquisa") : "" %>">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
            </form>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Paciente <i class="fas fa-rss"></i></th>
                        <th scope="col" class="text-center">Idade <i class="fas fa-hand-holding-usd"></i></th>
                        <th scope="col" class="text-center">Data Atendimento<i class="far fa-calendar-alt"></i></th>
                        <th scope="col" class="text-center">CPF <i class="fas fa-form"></i></th>
                        <th scope="col" class="text-center">Data Nascimento <i class="fas fa-form"></i></th>
                        <th scope="col" class="text-center">Telefone <i class="fas fa-form"></i></th>
                        <th scope="col" class="text-center">Iniciar Triagem <i class="fas fa-form"></i></th>
                        <th scope="col" class="text-center">Editar <i class="fas fa-edit"></i></th>
                    </tr>
                </thead>

                <%
                    PacienteDAO pacienteDAO = new PacienteDAO();
                    Paciente paciente = new Paciente();

                    //ArrayList<Paciente> listaPaciente = pacienteDAO.pesquisarTudo();
                    String termoPesquisa = request.getParameter("pesquisa");
                    ArrayList<Paciente> listaPaciente;

                    if (termoPesquisa != null && !termoPesquisa.trim().isEmpty()) {
                        listaPaciente = pacienteDAO.pesquisarPorNome(termoPesquisa);
                    } else {
                        listaPaciente = pacienteDAO.pesquisarTudo();
                    }
                    DecimalFormat df = new DecimalFormat("#,##0.00");

                    for (int i = 0; i < listaPaciente.size(); i++) {
                        paciente = listaPaciente.get(i);
                %>

                <tr>
                    <!--ONDE OS DADOS COMEÇAM LISTADOS-->
                    <td class="align-middle"><%=paciente.getNome()%></td>
                    <td class="text-center align-middle"><%=paciente.getIdade()%></td>
                    <td class="text-center align-middle"><%=paciente.getDataPaciente()%></td>
                    <td class="text-center align-middle"><%=paciente.getCpf()%></td>
                    <td class="text-center align-middle"><%=paciente.getDataNascimentoFormatada()%></td>
                    <td class="text-center align-middle"><%=paciente.getTelefone()%></td>
                    <!--INICIAR TRIAGEM-->
                    <td class="text-center align-middle">

                        <form action="ServletIniciarAtendimento" method="POST">
                            <div>
                                <input type="hidden" value="<%= paciente.getCodigo()%>" name="idUsuario">
                            </div>
                            <button type="submit" class="btn btn-light">Enviar para triagem</button>
                        </form>

                    </td>
                    <!--FIM TRIAGEM-->
                    <td class="text-center align-middle">
                       
                        <a href="#" class="btn btn-light"
                           onclick="editarPaciente(this, '<%=paciente.getCodigo()%>')"
                           data-toggle="tooltip" data-placement="top" title="Editar">
                            <i class="fas fa-pen-nib"></i>
                        </a>

                        <a href="ServletDeletarPaciente?codigo=<%=paciente.getCodigo()%>"
                           onclick="return confirm('Tem certeza que deseja apagar esse registro? Esta ação não poderá ser desfeita.')"
                           class="btn btn-outline-danger"
                           data-toggle="tooltip" data-placement="top" title="Apagar">
                            <i class="fas fa-trash-alt"></i>
                        </a>
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
                            <i class="fas fa-cube mr-2"></i>Editar PACIENTE
                        </h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form method="POST" action="ServletEditarPaciente">
                            <div class="form-group mt-3">
                                <label for="nome">Nome</label>
                                <input class="form-control" name="nome" id="nome"></input>
                            </div>

                            <div class="form-group mt-3">
                                <label for="idade">Idade</label>
                                <input class="form-control" type="number" name="idade" id="idade">
                            </div>

                            <div class="form-group mt-3">
                                <label for="cpf">CPF</label>
                                <input class="form-control" type="text" name="cpf" id="cpf">
                            </div>

                            <div class="form-group mt-3">
                                <label for="telefone">Telefone</label>
                                <input class="form-control" type="text" name="telefone" id="telefone">
                            </div>

                            <div class="form-group mt-3">
                                <label for="dataNascimento">Data de nascimento</label>
                                <input class="form-control" type="date" name="dataNascimento" id="dataNascimento">
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
                            <i class="fas fa-cube mr-2"></i>Cadastrar PACIENTE
                        </h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form method="POST" action="ServletCadastrarPaciente">
                            <div class="form-group mt-3">
                                <div>
                                    <input type="hidden" value="<%= session.getAttribute("id")%>" name="idUsuario">
                                </div>
                                <label for="nome">NOME</label>
                                <input class="form-control" name="nome" id="nome"></input>
                            </div>

                            <div class="form-group mt-3">
                                <label for="idade">Idade</label>
                                <input class="form-control" type="number" name="idade" id="idade">
                            </div>

                            <div class="form-group mt-3">
                                <label for="cpf">CPF</label>
                                <input class="form-control" type="text" name="cpf" id="cpf">
                            </div>

                            <div class="form-group mt-3">
                                <label for="telefone">Telefone</label>
                                <input class="form-control" type="text" name="telefone" id="telefone">
                            </div>

                            <div class="form-group mt-3">
                                <label for="dataNascimento">Data de nascimento</label>
                                <input class="form-control" type="date" name="dataNascimento" id="dataNascimento">
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
//                               $('#valor').mask('#.##0,00', {reverse: true});

                               (function () {
                                   $("[data-toggle='tooltip']").tooltip();
                               })();

                               function editarPaciente(element, codigo) {
                                   const tr = $(element).closest("tr");

                                   const nome = $(tr).find("td")[0].innerText;
                                   const idade = $(tr).find("td")[1].innerText;
                                   const cpf = $(tr).find("td")[3].innerText;
                                   const dataNascTexto = $(tr).find("td")[4].innerText;
                                   const telefone = $(tr).find("td")[5].innerText;

                                   $("#codigo").val(codigo);
                                   $("#nome").val(nome);
                                   $("#idade").val(idade);
                                   $("#cpf").val(cpf);
                                   $("#dataNascimento").val(dataNascTexto);
                                   $("#telefone").val(telefone);

                                   $("#modalEditar").modal("show");
                               }
    </script>
</html>

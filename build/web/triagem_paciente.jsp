<%@page import="com.controle.Triagem"%>
<%@page import="com.modelo.TriagemDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Atendimento Pacientes</title>

        <!-- Bootstrap & jQuery CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f9f9f9;
                color: #222;
            }
            h1 {
                text-align: center;
                margin-top: 30px;
                color: #d32f2f;
            }
            .container {
                width: 90%;
                max-width: 1000px;
                margin: 50px auto;
                background: #fff;
                padding: 20px 30px;
                box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
                border-radius: 8px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                text-align: center;
            }
            thead {
                background-color: #212121;
                color: #fff;
            }
            th, td {
                padding: 12px 15px;
                border-bottom: 1px solid #ddd;
            }
            tbody tr:hover {
                background-color: #f1f1f1;
            }
            a.button {
                background-color: #d32f2f;
                color: white;
                padding: 8px 12px;
                text-decoration: none;
                border-radius: 4px;
                transition: background 0.3s ease;
            }
            a.button:hover {
                background-color: #b71c1c;
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
                            <a class="nav-link" href="#">Triagem <span class="sr-only">(atual)</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h1>Triagem de Pacientes</h1>
            <table>
                <thead>
                    <tr>
                        <th>ID Atendimento</th>
                        <th>Nome do Paciente</th>
                        <th>Pressão</th>
                        <th>Peso</th>
                        <th>Altura</th>
                        <th>Observações</th>
                        <th>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        TriagemDAO triagemDAO = new TriagemDAO();
                        ArrayList<Triagem> listaTriagem = triagemDAO.listarTriagensComPaciente();
                        for (Triagem t : listaTriagem) {
                    %>
                    <tr>
                        <td><%= t.getIdAtendimento() %></td>
                        <td><%= t.getNomePaciente() %></td>
                        <td><%= t.getPressao() %></td>
                        <td><%= t.getPeso() %> kg</td>
                        <td><%= t.getAltura() %> m</td>
                        <td><%= t.getObservacoes() %></td>
                        <td>
                            <div style="display: flex; gap: 8px; flex-wrap: nowrap;">
                                <a href="#" class="btn btn-success btn-sm"
                                   data-toggle="modal" data-target="#modalTriagem"
                                   data-idatendimento="<%= t.getIdAtendimento() %>"
                                   data-nome="<%= t.getNomePaciente() %>"
                                   data-pressao="<%= t.getPressao() %>"
                                   data-peso="<%= t.getPeso() %>"
                                   data-altura="<%= t.getAltura() %>"
                                   data-observacoes="<%= t.getObservacoes() %>">
                                    Iniciar Triagem
                                </a>
                                <a href="#" class="btn btn-primary btn-sm"
                                   data-toggle="modal" data-target="#modalDetalhesPaciente"
                                   data-nome="<%= t.getNomePaciente() %>"
                                   data-telefone="<%= t.getTelefone() %>"
                                   data-cpf="<%= t.getCpf() %>"
                                   data-datanascimento="<%= t.getDataNascimento() %>">
                                    Detalhes do Paciente
                                </a>
                                <form action="ServletDeletarTriagem" method="POST" onsubmit="return confirm('Deseja realmente deletar este paciente?');">
                                    <input type="hidden" name="idAtendimento" value="<%= t.getIdAtendimento() %>">
                                    <button class="btn btn-danger btn-sm" type="submit">DELETAR PACIENTE</button>
                                </form>

                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Modal Triagem -->
        <div class="modal fade" id="modalTriagem" tabindex="-1" role="dialog" aria-labelledby="modalTriagemLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h5 class="modal-title" id="modalTriagemLabel">Triagem do Paciente</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <form action="ServletAtualizarTriagem" method="POST">
                        <input type="hidden" name="idAtendimento" id="idAtendimentoModal">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="nomePaciente">Nome do Paciente</label>
                                <input type="text" class="form-control" id="nomePaciente" readonly>
                            </div>

                            <div class="form-group">
                                <label for="pressao">Pressão</label>
                                <input type="text" class="form-control" name="pressao" id="pressao">
                            </div>

                            <div class="form-group">
                                <label for="peso">Peso (kg)</label>
                                <input type="text" class="form-control" name="peso" id="peso">
                            </div>

                            <div class="form-group">
                                <label for="altura">Altura (m)</label>
                                <input type="text" class="form-control" name="altura" id="altura">
                            </div>

                            <div class="form-group">
                                <label for="observacoes">Observações</label>
                                <textarea class="form-control" name="observacoes" id="observacoes" rows="3"></textarea>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            <button type="submit" class="btn btn-danger">Salvar Triagem</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal Detalhes do Paciente -->
        <div class="modal fade" id="modalDetalhesPaciente" tabindex="-1" role="dialog" aria-labelledby="modalDetalhesPacienteLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h5 class="modal-title" id="modalDetalhesPacienteLabel">Detalhes do Paciente</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <p><strong>Nome:</strong> <span id="nome"></span></p>
                        <p><strong>Telefone:</strong> <span id="telefone"></span></p>
                        <p><strong>CPF:</strong> <span id="cpf"></span></p>
                        <p><strong>Data de Nascimento:</strong> <span id="dataNascimento"></span></p>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        
        <script>
            $('#modalTriagem').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);

                $('#idAtendimentoModal').val(button.data('idatendimento'));
                $('#nomePaciente').val(button.data('nome'));
                $('#pressao').val(button.data('pressao'));
                $('#peso').val(button.data('peso'));
                $('#altura').val(button.data('altura'));
                $('#observacoes').val(button.data('observacoes'));
            });
        </script>
        <script>
            $('#modalDetalhesPaciente').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var nome = button.data('nome');
                var telefone = button.data('telefone');
                var cpf = button.data('cpf');
                var nascimento = button.data('datanascimento');

                var modal = $(this);
                modal.find('#nome').text(nome);
                modal.find('#telefone').text(telefone);
                modal.find('#cpf').text(cpf);
                modal.find('#dataNascimento').text(nascimento);
            });
        </script>
    </body>
</html>

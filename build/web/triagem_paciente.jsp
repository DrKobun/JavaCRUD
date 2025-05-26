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
                        <a href="#" class="button" 
                           data-toggle="modal" data-target="#modalTriagem"
                           data-idatendimento="<%= t.getIdAtendimento() %>"
                           data-nome="<%= t.getNomePaciente() %>"
                           data-pressao="<%= t.getPressao() %>"
                           data-peso="<%= t.getPeso() %>"
                           data-altura="<%= t.getAltura() %>"
                           data-observacoes="<%= t.getObservacoes() %>">
                           Iniciar Triagem
                        </a>
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

                        <input type="hidden" name="idAtendimento" id="idAtendimento">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" class="btn btn-danger">Salvar Triagem</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- JS para preencher o modal com dados -->
    <script>
        $('#modalTriagem').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);

            $('#idAtendimento').val(button.data('idatendimento'));
            $('#nomePaciente').val(button.data('nome'));
            $('#pressao').val(button.data('pressao'));
            $('#peso').val(button.data('peso'));
            $('#altura').val(button.data('altura'));
            $('#observacoes').val(button.data('observacoes'));
        });
    </script>
</body>
</html>

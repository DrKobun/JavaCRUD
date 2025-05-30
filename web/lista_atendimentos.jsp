<%-- 
    Document   : lista_atendimentos
    Created on : 29 de mai. de 2025, 23:06:02
    Author     : Wally
--%>
<%
//    boolean logado = session.getAttribute("email") == null ? false : true;
//    String idAtendimento = String.valueOf(session.getAttribute("idAtendimento"));
%>

<%
    String nomePaciente = (String) session.getAttribute("nomePaciente");
    int idAtendimento = (Integer) session.getAttribute("idAtendimento");

    System.out.println("NOME DO PACIENTE: " + nomePaciente);
    System.out.println("ID ATENDIMENTO: " + idAtendimento);
    
    LoginAvaliacaoDAO dao = new LoginAvaliacaoDAO();
    Avaliacao dadosCompletos = dao.buscarDadosCompletos(idAtendimento, nomePaciente);
    
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.controle.Avaliacao"%>
<%@page import="com.modelo.LoginAvaliacaoDAO"%>
<!DOCTYPE html>

<html>
<head>
    <title>Avaliação do Paciente</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 60%;
            margin: 50px auto;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ccc;
            padding: 15px;
        }
        th {
            background-color: #eee;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
 
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
        }
        .modal {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 500px;
            position: relative;
        }
        .modal label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        .modal input[readonly], textarea {
            width: 100%;
            padding: 8px;
            background-color: #f1f1f1;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .modal .radio-group {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }
        .modal button.submit-btn {
            margin-top: 15px;
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
        }
        .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 18px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <th colspan="2">Informações do Paciente</th>
        </tr>
        <tr>
            <td><strong>Nome:</strong></td>
            <td><%= nomePaciente %></td>
        </tr>
        <tr>
            <td><strong>ID do Atendimento:</strong></td>
            <td><%= idAtendimento %></td>
        </tr>
        <tr>
            <td colspan="2">
                <button onclick="abrirModal()">Iniciar Avaliação</button>
            </td>
        </tr>
    </table>

    <!-- Modal -->
    <div class="modal-overlay" id="modalAvaliacao">
        <div class="modal">
            <span class="close-btn" onclick="fecharModal()">×</span>
            <form method="post" action="ServletAvaliacaoFinal">
                <h2>Avaliação</h2>

                <label>Nome do Paciente:</label>
                <input type="text" name="nomePaciente" value="<%=nomePaciente %>" readonly>

                <label>ID Atendimento:</label>
                <input type="text" name="idAtendimento" value="<%= idAtendimento %>" readonly>

                <label>Pressão:</label>
                <input type="text" value="<%= dadosCompletos.getPressao() %>" readonly>

                

                <label>Peso:</label>
                <input type="text" value="<%= dadosCompletos.getPeso() %>" readonly>

                <label>Altura:</label>
                <input type="text" value="<%= dadosCompletos.getAltura() %>" readonly>

                <label>Avaliação:</label>
                <div class="radio-group">
                    <label><input type="radio" name="avaliacao" value="1" required>1</label>
                    <label><input type="radio" name="avaliacao" value="2">2</label>
                    <label><input type="radio" name="avaliacao" value="3">3</label>
                    <label><input type="radio" name="avaliacao" value="4">4</label>
                    <label><input type="radio" name="avaliacao" value="5">5</label>
                </div>

                <label>Observações:</label>
                <textarea name="observacoes" rows="3"></textarea>

                <button type="submit" class="submit-btn">Enviar Avaliação</button>
            </form>
        </div>
    </div>

    <script>
        function abrirModal() {
            document.getElementById("modalAvaliacao").style.display = "flex";
        }

        function fecharModal() {
            document.getElementById("modalAvaliacao").style.display = "none";
        }
    </script>

</body>
</html>
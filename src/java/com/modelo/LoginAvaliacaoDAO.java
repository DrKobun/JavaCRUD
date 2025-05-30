/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.controle.Avaliacao;

/**
 *
 * @author Wally
 */
public class LoginAvaliacaoDAO extends DAO {

    public Avaliacao pesquisar(Avaliacao avaliacao) {
        Avaliacao loginBuscado = new Avaliacao();

        try {
            abrirBanco();
            String query = "SELECT id, idAtendimento, nomePaciente FROM loginpaciente WHERE idAtendimento = ? AND nomePaciente = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, avaliacao.getIdAtendimento());
            pst.setString(2, avaliacao.getNomePaciente());

            rs = pst.executeQuery();

            while (rs.next()) {
                loginBuscado.setIdAtendimento(rs.getInt("idAtendimento"));
                loginBuscado.setNomePaciente(rs.getString("nomePaciente"));
            }

            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }

        return loginBuscado;
    }

    public Avaliacao buscarDadosPacientePorAtendimento(int idAtendimento) {
        Avaliacao avaliacao = new Avaliacao();
        try {
            abrirBanco();
            String query = """
            SELECT p.nome, a.id AS idAtendimento
            FROM loginpaciente lp
            JOIN atendimento a ON a.id = lp.idAtendimento
            JOIN paciente p ON a.idPaciente = p.id
            WHERE lp.idAtendimento = ?
        """;
            pst = con.prepareStatement(query);
            pst.setInt(1, idAtendimento);
            rs = pst.executeQuery();

            if (rs.next()) {
                avaliacao.setNomePaciente(rs.getString("nome"));
                avaliacao.setIdAtendimento(rs.getInt("idAtendimento"));
            }

            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao buscar dados do paciente: " + e.getMessage());
        }

        return avaliacao;
    }

    public Avaliacao buscarDadosCompletos(int idAtendimento, String nomePaciente) {
    Avaliacao avaliacao = new Avaliacao();

    try {
        abrirBanco();

        String sql = "SELECT " +
                     "    p.nome AS nomePaciente, " +
                     "    a.id AS idAtendimento, " +
                     "    t.pressao, t.peso, t.altura, t.observacoes " +
                     "FROM loginpaciente lp " +
                     "JOIN paciente p ON lp.nomePaciente = p.nome " +
                     "JOIN atendimento a ON lp.idAtendimento = a.id " +
                     "JOIN triagem t ON t.idAtendimento = a.id " +
                     "WHERE lp.idAtendimento = ? AND lp.nomePaciente = ?";

        pst = con.prepareStatement(sql);
        pst.setInt(1, idAtendimento);
        pst.setString(2, nomePaciente);

        rs = pst.executeQuery();

        if (rs.next()) {
            avaliacao.setNomePaciente(rs.getString("nomePaciente"));
            avaliacao.setIdAtendimento(rs.getInt("idAtendimento"));
            avaliacao.setPressao(rs.getString("pressao"));
            avaliacao.setPeso(rs.getString("peso"));
            avaliacao.setAltura(rs.getString("altura"));
            avaliacao.setObservacoes(rs.getString("observacoes"));

           
            System.out.println("Nome do Paciente: " + avaliacao.getNomePaciente());
            System.out.println("ID do Atendimento: " + avaliacao.getIdAtendimento());
            System.out.println("Pressão: " + avaliacao.getPressao());
            System.out.println("Peso: " + avaliacao.getPeso());
            System.out.println("Altura: " + avaliacao.getAltura());
            System.out.println("Observações: " + avaliacao.getObservacoes());
        }

        fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro ao buscar dados completos: " + e.getMessage());
    }

    return avaliacao;
}



}

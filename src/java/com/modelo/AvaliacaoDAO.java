/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;
/**
 *
 * @author Wally
 */
public class AvaliacaoDAO extends DAO {

   public void registrarAvaliacao(int idAtendimento, int avaliacao, String observacoes) {
    try {
        abrirBanco();

        String sql = "UPDATE loginpaciente SET avaliacao = ?, observacoes = ? WHERE idAtendimento = ?";
        pst = con.prepareStatement(sql);
        pst.setInt(1, avaliacao);
        pst.setString(2, observacoes);
        pst.setInt(3, idAtendimento);

        int linhasAfetadas = pst.executeUpdate();

        if (linhasAfetadas > 0) {
            System.out.println("Avaliação registrada com sucesso.");
        } else {
            System.out.println("Nenhum registro atualizado. Verifique o idAtendimento.");
        }

        fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro ao registrar avaliação: " + e.getMessage());
    }
}

}

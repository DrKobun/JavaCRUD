/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.controle.Triagem;
import java.util.ArrayList;

import java.sql.PreparedStatement;
import java.util.List;

/**
 *
 * @author Wally
 */
public class TriagemDAO extends DAO{
    
    
    
    public void inserirTriagem(Triagem triagem) {
        try {
            abrirBanco();
            String query = "INSERT INTO triagem(idAtendimento) VALUES(?)";
            pst = (PreparedStatement) con.prepareStatement(query);
            
            pst.setInt(1, triagem.getIdAtendimento());
            
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro CADASTRAR TRIAGEM " + e.getMessage());
        }
    }
    
    
    
    
    
    
    public ArrayList<Triagem> listarTriagensComPaciente() {
     ArrayList listaPaciente = new ArrayList<Triagem>();
    try {
        abrirBanco();
        String sql = "SELECT t.idAtendimento, p.nome, t.pressao, t.peso, t.altura, t.observacoes " +
                     "FROM triagem t " +
                     "JOIN atendimento a ON t.idAtendimento = a.id " +
                     "JOIN paciente p ON a.idPaciente = p.id";

        pst = con.prepareStatement(sql);
        rs = pst.executeQuery();

        while (rs.next()) {
            Triagem t = new Triagem();
            t.setIdAtendimento(rs.getInt("idAtendimento"));
            t.setNomePaciente(rs.getString("nome")); // você precisa adicionar este campo na classe
            t.setPressao(rs.getString("pressao"));
            t.setPeso(rs.getDouble("peso"));
            t.setAltura(rs.getDouble("altura"));
            t.setObservacoes(rs.getString("observacoes"));
            listaPaciente.add(t);
        }

        fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro ao listar triagens com paciente: " + e.getMessage());
    }
    return listaPaciente;
}
    
    
    public void alterarTriagem(Triagem triagem) {
        try {
            abrirBanco();
            String query = "UPDATE triagem SET pressao = ?, peso = ?, altura = ?, observacoes = ? WHERE idAtendimento = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, triagem.getPressao());
            pst.setDouble(2, triagem.getPeso());
            pst.setDouble(3, triagem.getAltura());
            pst.setString(4, triagem.getObservacoes());
            pst.setInt(5, triagem.getIdAtendimento());
            
            pst.executeUpdate();
            fecharBanco();

        } catch (Exception e) {
            System.out.println("Erro ALTERAR TRIAGEM: " + e.getMessage());
        }
    }
//    ADICIONAR DELETAR
}

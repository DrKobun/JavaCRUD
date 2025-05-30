/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.controle.Atendimento;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import java.sql.ResultSet;
/**
 *
 * @author Wally
 */
public class AtendimentoDAO extends DAO {
    
//   public void inserirAtendimento(Atendimento atendimento) {
//        try {
//            abrirBanco();
//            String query = "INSERT INTO atendimento(idPaciente, dataAtendimento, status) VALUES(?, NOW(), 'Aguardando Triagem')";
//            pst = (PreparedStatement) con.prepareStatement(query);
//            
//            pst.setInt(1, atendimento.getIdPaciente());
//            
//            
//            
//            pst.execute();
//            fecharBanco();
//        } catch (Exception e) {
//            System.out.println("Erro INSERIR ATENDIMENTO: " + e.getMessage() + " ID DO PACIENTE: " + atendimento.getIdPaciente());
//        }
//    }
   
    
    public void adicionarAtendimentoComTriagem(Atendimento atendimento) {
    try {
        abrirBanco();


        String queryAtendimento = "INSERT INTO atendimento (idPaciente, dataAtendimento, status) VALUES (?, NOW(), 'Aguardando Triagem')";
        pst = con.prepareStatement(queryAtendimento, java.sql.Statement.RETURN_GENERATED_KEYS);
        pst.setInt(1, atendimento.getIdPaciente());
        pst.executeUpdate();


        ResultSet rs = pst.getGeneratedKeys();
        int idAtendimentoGerado = 0;
        if (rs.next()) {
            idAtendimentoGerado = rs.getInt(1);
        }


        String queryTriagem = "INSERT INTO triagem (idAtendimento, pressao, peso, altura, observacoes) VALUES (?, '', 0, 0, '')";
        pst = con.prepareStatement(queryTriagem);
        pst.setInt(1, idAtendimentoGerado);
        pst.executeUpdate();

        fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro ao adicionar atendimento com triagem: " + e.getMessage());
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//   LISTAR
   public ArrayList<Atendimento> pesquisarTudo() {
        ArrayList listaPaciente = new ArrayList<Atendimento>();
        try {
            abrirBanco();
            String query = "SELECT * FROM paciente ORDER BY (id) DESC";
            pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            Atendimento atendimento;
            while (rs.next()) {
                atendimento = new Atendimento();
                atendimento.setIdPaciente(rs.getInt("idPaciente"));
                
                listaPaciente.add(atendimento);
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro PESQUISAR TUDO ATENDIMENTO: " + e.getMessage());
        }
        return listaPaciente;
    }
   
   
}

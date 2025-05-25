/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.controle.Paciente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
/**
 *
 * @author laboratorio
 */
public class PacienteDAO extends DAO{
    
    public void inserir(Paciente paciente) {
        try {
            abrirBanco();
            String query = "INSERT INTO paciente(nome, idUsuario, idade, dataPaciente, cpf, dataNascimento, telefone) VALUES(?, ?, ?, ?, ?, ?, ?)";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, paciente.getNome());
            pst.setInt(2, paciente.getIdUsuario());
            pst.setInt(3, paciente.getIdade());
            pst.setDate(4, new java.sql.Date(Calendar.getInstance().getTimeInMillis()));
            pst.setString(5, paciente.getCpf());
            pst.setDate(6, paciente.getDataNascimento());
            pst.setString(7, paciente.getTelefone());
            
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro CADASTRAR" + e.getMessage());
        }
    }

    public ArrayList<Paciente> pesquisarTudo() {
        ArrayList listaPaciente = new ArrayList<Paciente>();
        try {
            abrirBanco();
            String query = "SELECT id, nome, idade, idUsuario, cpf, dataNascimento , DATE_FORMAT(dataPaciente, '%d/%m/%Y') AS dataPaciente, telefone FROM paciente ORDER BY (id) DESC";
            pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            Paciente paciente;
            while (rs.next()) {
                paciente = new Paciente();
                paciente.setCodigo(rs.getInt("id"));
                paciente.setNome(rs.getString("nome"));
                paciente.setIdade(rs.getInt("idade"));
                paciente.setIdUsuario(rs.getInt("idUsuario"));
                paciente.setDataPaciente(rs.getString("dataPaciente"));
                paciente.setCpf(rs.getString("cpf"));
                paciente.setDataNascimento(rs.getDate("dataNascimento"));
                paciente.setTelefone(rs.getString("telefone"));
                listaPaciente.add(paciente);
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro PESQUISAR TUDO" + e.getMessage());
        }
        return listaPaciente;
    }
    
    public void deletar(Paciente paciente) {
        try {
            abrirBanco();
            String query = "DELETE FROM paciente WHERE id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, paciente.getCodigo());
            pst.execute();
            fecharBanco();
            
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }

    public void alterar(Paciente paciente) {
        try {
            abrirBanco();
            String query = "UPDATE paciente SET nome = ?, idade = ?, cpf = ?, dataNascimento = ?, telefone = ? WHERE id = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, paciente.getNome());
            pst.setInt(2, paciente.getIdade());
            pst.setString(3, paciente.getCpf());
            pst.setString(4, paciente.getDataNascimentoFormatada());
            pst.setString(5, paciente.getTelefone());
            pst.setInt(6, paciente.getCodigo());
            pst.executeUpdate();
            fecharBanco();

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }
    
    public Paciente pesquisar(int id) {
        try {
            Paciente paciente = new Paciente();
            abrirBanco();
            String query = "SELECT * FROM paciente WHERE codigo = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                paciente.setCodigo(rs.getInt("codigo"));
                paciente.setNome(rs.getString("nome"));
                paciente.setIdade(rs.getInt("idade"));
                paciente.setIdUsuario(rs.getInt("idUsuario"));
                paciente.setDataPaciente(rs.getString("dataPaciente"));
                paciente.setCpf(rs.getString("cpf"));
                paciente.setTelefone(rs.getString("telefone"));
                paciente.setDataNascimento(rs.getDate("dataNascimento"));
                return paciente;
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
        return null;
    }
    
}

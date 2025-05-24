/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.controle.Noticia;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

public class NoticiasDAO extends DAO {

    public void inserir(Noticia noticia) {
        try {
            abrirBanco();
            String query = "INSERT INTO cadastro_noticias(noticia, idUsuario, valor, dataCadastro) VALUES(?, ?, ?, ?)";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, noticia.getNoticia());
            pst.setDouble(2, noticia.getIdUsuario());
            pst.setDouble(3, noticia.getValor());
            pst.setDate(4, new java.sql.Date(Calendar.getInstance().getTimeInMillis()));
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }

    public ArrayList<Noticia> pesquisarTudo() {
        ArrayList<Noticia> listaNoticias = new ArrayList<Noticia>();
        try {
            abrirBanco();
            String query = "SELECT id, noticia, valor, idUsuario, DATE_FORMAT(dataCadastro, '%d/%m/%Y') AS dataCadastro FROM cadastro_noticias ORDER BY (id) DESC";
            pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            Noticia noticia;
            while (rs.next()) {
                noticia = new Noticia();
                noticia.setCodigo(rs.getInt("id"));
                noticia.setNoticia(rs.getString("noticia"));
                noticia.setValor(rs.getDouble("valor"));
                noticia.setIdUsuario(rs.getInt("idUsuario"));
                noticia.setDataNoticia(rs.getString("dataCadastro"));
                listaNoticias.add(noticia);
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
        return listaNoticias;
    }

    public void deletar(Noticia noticia) {
        try {
            abrirBanco();
            String query = "DELETE FROM cadastro_noticias WHERE id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, noticia.getCodigo());
            pst.execute();
            fecharBanco();
            
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }

    public void alterar(Noticia noticia) {
        try {
            abrirBanco();
            String query = "UPDATE cadastro_noticias SET noticia = ?, valor = ? WHERE id = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, noticia.getNoticia());
            pst.setDouble(2, noticia.getValor());
            pst.setInt(3, noticia.getCodigo());
            pst.executeUpdate();
            fecharBanco();

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }

    public Noticia pesquisar(int id) {
        try {
            Noticia noticia = new Noticia();
            abrirBanco();
            String query = "SELECT * FROM cadastro_noticias WHERE codigo = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                noticia.setCodigo(rs.getInt("codigo"));
                noticia.setNoticia(rs.getString("noticia"));
                noticia.setValor(rs.getDouble("valor"));
                noticia.setIdUsuario(rs.getInt("idUsuario"));
                noticia.setDataNoticia(rs.getString("dataNoticia"));
                return noticia;
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
        return null;
    }
}

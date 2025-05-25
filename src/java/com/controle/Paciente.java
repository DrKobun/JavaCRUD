/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.controle;

import java.util.Date;

/**
 *
 * @author laboratorio
 */
public class Paciente {

    private int codigo;
    private String nome;
    private int idade;
    private int idUsuario;
    private String dataPaciente;
    private String cpf;
    private java.sql.Date dataNascimento;
    private String telefone;

    
    
    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
    public java.sql.Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(java.sql.Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getDataNascimentoFormatada() {
        if (dataNascimento != null) {
            return new java.text.SimpleDateFormat("yyyy-MM-dd").format(dataNascimento);
        }
        return "";
    }

//    private String dataNascimento;
//
//    public String getDataNascimento() {
//        return dataNascimento;
//    }
//
//    public void setDataNascimento(String dataNascimento) {
//        this.dataNascimento = dataNascimento;
//    }
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getDataPaciente() {
        return dataPaciente;
    }

    public void setDataPaciente(String dataPaciente) {
        this.dataPaciente = dataPaciente;
    }

}

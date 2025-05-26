/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.controle.Paciente;
import com.modelo.PacienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author Danilo Miranda
 */
@WebServlet(name = "ServletEditarPaciente", urlPatterns = {"/ServletEditarPaciente"})
public class ServletEditarPaciente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int codigo = Integer.parseInt(String.valueOf(request.getParameter("codigo")));
            String nome = request.getParameter("nome");
            int idade = Integer.parseInt(String.valueOf(request.getParameter("idade")));
            String cpf = request.getParameter("cpf");
            //String dataNascimento = request.getParameter("dataNascimento");
            String dataNascimentoStr = request.getParameter("dataNascimento");
            Date dataNascimento = Date.valueOf(dataNascimentoStr);
            String telefone = request.getParameter("telefone");
            
            
            System.out.println("EDITAR PACIENTE: " + cpf);
            Paciente paciente = new Paciente();
            paciente.setCodigo(codigo);
            paciente.setNome(nome);
            paciente.setIdade(idade);
            paciente.setCpf(cpf);
            paciente.setDataNascimento(dataNascimento);
            paciente.setTelefone(telefone);

            System.out.println("EDITAR NOME: " + nome);
            System.out.println("EDITAR IDADE: " + idade);
            System.out.println("EDITAR CPF:" + cpf);
            System.out.println("EDITAR DATA NASCIMENTO: " + dataNascimento);
            System.out.println("EDITAR DATA TELEFONE: " + telefone);

            PacienteDAO pacienteDAO = new PacienteDAO();
            pacienteDAO.alterar(paciente);

            request.getRequestDispatcher("indexPaciente.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

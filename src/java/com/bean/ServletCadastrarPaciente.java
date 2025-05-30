/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bean;

import com.controle.Paciente;
import com.modelo.PacienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author laboratorio
 */
public class ServletCadastrarPaciente extends HttpServlet {

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

            int idUsuario = Integer.parseInt(String.valueOf(request.getParameter("idUsuario")));
            String nome = request.getParameter("nome");
            int idade = Integer.parseInt(String.valueOf(request.getParameter("idade")));
            String cpf = request.getParameter("cpf");
//            String dataNascimento = request.getParameter("dataNascimento");
            String dataNascimentoStr = request.getParameter("dataNascimento");
            Date dataNascimento = Date.valueOf(dataNascimentoStr);
            String telefone = request.getParameter("telefone");

            System.out.println("ID DO USUÁRIO: " + idUsuario);
            System.out.println("NOME:  " + nome);
            System.out.println("IDADE: " + idade);
            System.out.println("CPF: " + cpf);
            System.out.println("DATA NASCIMENTO: " + dataNascimento);
            System.out.println("TELEFONE: " + telefone);

            Paciente paciente = new Paciente();

            paciente.setIdUsuario(idUsuario);
            paciente.setNome(nome);
            paciente.setIdade(idade);
            paciente.setCpf(cpf);
            paciente.setDataNascimento(dataNascimento);
            paciente.setTelefone(telefone);
//            out.println("<h1>" + noticia.getIdUsuario() +"</h1>");
//            out.println("<h1>" + noticia.getNoticia() +"</h1>");
//            out.println("<h1>" + noticia.getValor() +"</h1>");
//            out.println("<h1>" + idUsuario + "</h1>");
//            out.println("<h1>" + noticiaStr + "</h1>");
//            out.println("<h1>" + valor + "</h1>");

            PacienteDAO pacienteDAO = new PacienteDAO();
            pacienteDAO.inserir(paciente);
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

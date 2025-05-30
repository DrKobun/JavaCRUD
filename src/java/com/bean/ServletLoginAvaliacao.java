/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bean;

import com.controle.Avaliacao;
import com.modelo.LoginAvaliacaoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Wally
 */
public class ServletLoginAvaliacao extends HttpServlet {

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

        String nomePaciente = request.getParameter("nomePaciente");
        int idAtendimento = Integer.parseInt(request.getParameter("idAtendimento"));

        Avaliacao avaliacao = new Avaliacao();
        avaliacao.setIdAtendimento(idAtendimento);
        avaliacao.setNomePaciente(nomePaciente);

        LoginAvaliacaoDAO loginDAO = new LoginAvaliacaoDAO();
        Avaliacao loginBuscado = loginDAO.pesquisar(avaliacao);

        if (loginBuscado.getNomePaciente() != null) {
            HttpSession session = request.getSession();
            session.setAttribute("idAtendimento", loginBuscado.getIdAtendimento());
            session.setAttribute("nomePaciente", loginBuscado.getNomePaciente());
            request.getRequestDispatcher("lista_atendimentos.jsp").forward(request, response);
        } else {
            request.setAttribute("erro", "Paciente não encontrado. Verifique os dados.");
            request.getRequestDispatcher("login_avaliacao.jsp").forward(request, response);
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

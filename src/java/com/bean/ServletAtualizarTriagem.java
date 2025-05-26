/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.controle.Triagem;
import com.modelo.TriagemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Danilo Miranda
 */
@WebServlet(name = "ServletAtualizarTriagem", urlPatterns = {"/ServletAtualizarTriagem"})
public class ServletAtualizarTriagem extends HttpServlet {

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
            int idAtendimento = Integer.parseInt(String.valueOf(request.getParameter("idAtendimento")));
            //String nomePaciente = request.getParameter("nomePaciente");
            String pressao = request.getParameter("pressao");
            double peso = Double.parseDouble(request.getParameter("peso"));
            double altura = Double.parseDouble(request.getParameter("altura"));
            String obs = request.getParameter("observacoes");
            
            System.out.println("ID PACIENTE: " + idAtendimento);
            System.out.println("PRESSÃO: " + pressao);
            System.out.println("PESO: " + peso);
            System.out.println("ALTURA: " + altura);
            System.out.println("OBSERVAÇÕES: " + obs);
            
            
            Triagem triagem = new Triagem();
            triagem.setIdAtendimento(idAtendimento);
            triagem.setPressao(pressao);
            triagem.setPeso(peso);
            triagem.setAltura(altura);
            triagem.setObservacoes(obs);

            

            TriagemDAO triagemDAO = new TriagemDAO();
            triagemDAO.alterarTriagem(triagem);

            request.getRequestDispatcher("triagem_paciente.jsp").forward(request, response);
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

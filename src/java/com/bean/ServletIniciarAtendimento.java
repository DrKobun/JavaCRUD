/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bean;

import com.controle.Atendimento;
import com.controle.Triagem;
import com.modelo.AtendimentoDAO;
import com.modelo.TriagemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author laboratorio
 */
public class ServletIniciarAtendimento extends HttpServlet {

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
//            int codigo = Integer.parseInt(String.valueOf(request.getParameter("codigo")));
            

            System.out.println("ID DO USUÁRIO: " + idUsuario);
            System.out.println("=========================");
//          System.out.println("CÓDIGO RESGATADO: " + codigo);
            
            
            Atendimento atendimento = new Atendimento();
            atendimento.setIdPaciente(idUsuario);
            //paciente.setIdUsuario(idUsuario);
            
//            out.println("<h1>" + noticia.getIdUsuario() +"</h1>");
//            out.println("<h1>" + noticia.getNoticia() +"</h1>");
//            out.println("<h1>" + noticia.getValor() +"</h1>");
//            out.println("<h1>" + idUsuario + "</h1>");
//            out.println("<h1>" + noticiaStr + "</h1>");
//            out.println("<h1>" + valor + "</h1>");

            AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
            //atendimentoDAO.inserirAtendimento(atendimento);
            atendimentoDAO.adicionarAtendimentoComTriagem(atendimento);
            
            
            
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

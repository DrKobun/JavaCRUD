/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.controle.Noticia;
import com.modelo.NoticiasDAO;
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
@WebServlet(name = "ServletCadastrarNoticia", urlPatterns = {"/ServletCadastrarNoticia"})
public class ServletCadastrarNoticia extends HttpServlet {

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
            String noticiaStr = request.getParameter("noticia");
            double valor = Double.parseDouble(String.valueOf(request.getParameter("valor")).replace(".", "").replace(",", "."));
            

            Noticia noticia = new Noticia();
            noticia.setIdUsuario(idUsuario);
            noticia.setNoticia(noticiaStr);
            noticia.setValor(valor);
//            out.println("<h1>" + noticia.getIdUsuario() +"</h1>");
//            out.println("<h1>" + noticia.getNoticia() +"</h1>");
//            out.println("<h1>" + noticia.getValor() +"</h1>");
//            out.println("<h1>" + idUsuario + "</h1>");
//            out.println("<h1>" + noticiaStr + "</h1>");
//            out.println("<h1>" + valor + "</h1>");

            NoticiasDAO noticiasDAO = new NoticiasDAO();
            noticiasDAO.inserir(noticia);
            request.getRequestDispatcher("index.jsp").forward(request, response);
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

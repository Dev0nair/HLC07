/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 3268i
 */
@WebServlet(name = "ServletRegistro", urlPatterns = {"/ServletRegistro"})
public class ServletRegistro extends HttpServlet {

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

        String sidtipo, snomb, spre, surl;

        sidtipo = request.getParameter("nid");

        snomb = request.getParameter("nnombre");

        spre = request.getParameter("nprecio");

        surl = request.getParameter("nurl");

        Productos pro = crearProducto(sidtipo, snomb, spre, surl);

        int metido = 0;
        
        if (pro != null) {
            realizarRegistroProducto(pro);
            metido = 1;
        } else {
            metido = 2;
        }

        recargarPagina(request, response, metido);

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

    private Productos crearProducto(String sidtipo, String snomb, String spre, String surl) {
        Productos aux = new Productos();

        try {
            aux.setIdProducto(Integer.parseInt(sidtipo));
            aux.setNombre(snomb);
            aux.setPrecio(Float.parseFloat(spre));
            aux.setImagen(surl);
        } catch (Exception e) {
            return null;
        }

        return aux;
    }

    private void realizarRegistroProducto(Productos pro) {
        new UsarBD().insertarNuevo(pro);
    }

    private void recargarPagina(HttpServletRequest request, HttpServletResponse response, int metido) throws ServletException, IOException {
        request.getSession().setAttribute("metido", metido);
        response.sendRedirect("mostrarDatos.jsp");
    }

}

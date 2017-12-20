/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nabil.controller;

import com.nabil.dao.MahasiswaDAO;
import com.nabil.entity.MahasiswaEntity;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Xyraclius
 */
public class MahasiswaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        if (request.getParameter("home") != null) {
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));

        } else if (request.getParameter("insertID") != null) {
            response.sendRedirect("insert");

        } else if (request.getParameter("editID") != null) {
            response.sendRedirect("edit?id=" + request.getParameter("editID"));

        } else if (request.getParameter("deleteID") != null) {
            int id = Integer.parseInt(request.getParameter("deleteID"));
            MahasiswaEntity mhs = MahasiswaDAO.findMahasiswa(id);
            boolean status = new MahasiswaDAO().delete(mhs);
            if (status) {
                request.getSession().setAttribute("sm", "Biodata deleted succesfully");
            } else {
                request.getSession().setAttribute("em", "Biodata not deleted");
            }
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
        }
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
        if (request.getParameter("insert-data") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nama = request.getParameter("nama");
            String kelas = request.getParameter("kelas");
            String jeniskelamin = request.getParameter("jeniskelamin");

            MahasiswaEntity mahasiswa = new MahasiswaEntity();

            mahasiswa.setId(id);
            mahasiswa.setNama(nama);
            mahasiswa.setKelas(kelas);
            mahasiswa.setJeniskelamin(jeniskelamin);

            boolean status = new MahasiswaDAO().save(mahasiswa);
            if (status) {
                request.getSession().setAttribute("sm", "Biodata saved succesfully");
            } else {
                request.getSession().setAttribute("em", "Biodata not saved");
            }
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
        } else if (request.getParameter("edit-data") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nama = request.getParameter("nama");
            String kelas = request.getParameter("kelas");
            String jeniskelamin = request.getParameter("jeniskelamin");

            MahasiswaEntity mahasiswa = new MahasiswaEntity();

            mahasiswa.setId(id);
            mahasiswa.setNama(nama);
            mahasiswa.setKelas(kelas);
            mahasiswa.setJeniskelamin(jeniskelamin);

            boolean status = new MahasiswaDAO().update(mahasiswa);
            if (status) {
                request.getSession().setAttribute("sm", "Biodata updated succesfully");
            } else {
                request.getSession().setAttribute("em", "Biodata not updated");
            }
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
        }
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

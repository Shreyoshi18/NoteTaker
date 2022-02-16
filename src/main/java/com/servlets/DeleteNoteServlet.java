package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import factory.FactoryProvider;
import notetaker.Note;


public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(request.getParameter("noteId").trim());
		Session session = FactoryProvider.getFactory().openSession();
		Transaction t = session.beginTransaction();
		Note note = (Note)session.get(Note.class,id);
		session.delete(note);
		t.commit();
		session.close();
		response.sendRedirect("all_notes.jsp");
	}

	
}

package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import factory.FactoryProvider;
import notetaker.Note;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Note note = new Note(title,content,new Date());
			SessionFactory factory = FactoryProvider.getFactory();
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			session.save(note);
			t.commit();
			session.close();
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1>Note has been added successfully</h1>");
			out.println("<h1> <a href = 'all_notes.jsp'> View All Notes</a> </h1>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//doGet(request, response);
	}

}

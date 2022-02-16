<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="factory.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="notetaker.Note"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes: NoteTaker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="nav.jsp"%>
		<br />
		<h1 class=" text-uppercase">All Notes:</h1>
		<div class="row">

			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query query = s.createQuery("from Note");
				List<Note> list = query.list();
				for (Note note : list) {
				%>
				<div class="card mt-4">
				
					<img class="card-img-top m-4 b-4 mx-auto" src="notes.png" alt="Image" style = "height:2%; max-width: 5%;">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<div class = "container text-center"><a href="DeleteNoteServlet?noteId=<%=note.getId()%>" class="btn btn-danger">Delete</a>
						<a href="update.jsp?noteId=<%=note.getId()%>" class="btn btn-primary">Update</a></div>
					</div>
				</div>
				
				<%
				}
				s.close();
				%>

			</div>
		</div>

	</div>

</body>
</html>
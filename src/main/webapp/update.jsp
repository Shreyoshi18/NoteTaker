<!DOCTYPE html>
<%@page import="notetaker.Note"%>
<%@page import="factory.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_js_css.jsp"%>
<title>ADD NOTES</title>
</head>
<body>
	<div class="container">
		<%@include file="nav.jsp"%>
		<h1>Make Your Changes Here</h1>
		<br />
		<p>Please Update Your Notes</p>
		<%int id = Integer.parseInt(request.getParameter("noteId").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note)s.get(Note.class,id);
		s.close();
		%>
		<!-- Form -->
		<form action = "UpdateServlet" method = "post">
		
		<input value="<%=note.getId()%>" name="noteId" type="hidden" />
		
			<div class="form-group">
				<label for="title">Note Title</label>
				 <input required 
				 name = "title"
				 type="text" 
				 class="form-control" 
				 id="title"
				 aria-describedby="emailHelp" 
				 placeholder="Enter your note's title">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label> 
				<textarea required 
				name = "content"
				class = "form-control" 
				id = "content" 
				placeholder = "Enter your content here."></textarea>
			</div>
			
			<button type="submit" class="btn btn-success">UPDATE</button>
		</form>
	</div>
</body>
</html>
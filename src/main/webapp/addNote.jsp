<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_js_css.jsp"%>
<title>ADD NOTES</title>
</head>
<body>
	<div class="container">
		<%@include file="nav.jsp"%>
		<br />
		<p>Please Add Your Notes</p>
		<!-- Form -->
		<form action = "SaveNoteServlet" method = "post">
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
			
			<button type="submit" class="btn btn-primary">ADD</button>
		</form>
	</div>
</body>
</html>
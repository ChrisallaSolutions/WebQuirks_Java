<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="operations" scope="request"
	class="com.chrisalla.solutions.ops.Operations" /> 
<jsp:setProperty name="operations" property="*" />
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<meta charset="UTF-8">
		<title>WebQuirks</title>
		<script>
			var lang = "<%= request.getParameter("lang")%>";
			let init = "<%= operations.getQuirks(request.getParameter("lang"), request.getParameter("players"))%>";
			let languageSet = <%= operations.fillLanguageSet()%>
			
			var html = languageSet.choose_text;
			let playerValue = <%= request.getParameter("players")%>;
			if(playerValue === null | playerValue === "") {
				playerValue = 1;
			} 
			html = html + '<form id="main_Form" action="start" method="POST">\n';
			html = html + '<input id="players" type="number" value="' + playerValue + '" min="1" name="players" required>\n';
			html = html + '<select id="lang" name="lang" onchange="refreshSelection()">\n';
			html = html + <%= operations.arrangeLanguageDropdown(request.getParameter("lang"))%>;
			html = html + '</select> <input type="submit" value="' + languageSet.go_button + '!">\n';
			html = html + '</form>\n';
		</script>
	</head>
	<body>
		<div id="menu"></div>
		<script>		
			document.getElementById('menu').innerHTML = html;
		
			function refreshSelection() {
				const refreshForm = document.getElementById('main_Form');
				refreshForm.action = "";
				refreshForm.submit();
			}
		</script>
	</body>
</html>
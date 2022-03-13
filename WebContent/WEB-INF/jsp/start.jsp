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
		<meta charset="UTF-8">
		<title>WebQuirks</title>
		<script>
			let languageSet = <%= operations.fillLanguageSet(request.getParameter("lang"))%>
		</script>
	
	</head>
	<body>
		<div >
			<button id="button" onclick="nextPlayer()"></button>
			<div id="play"></div>
			<form id="form" action="/" method="POST">
				<input id="lang" type="hidden" name="lang">
			</form>
			<button id="button2" onclick="submitForm()"></button>
		</div>
		<script>
			var lang = "<%= request.getParameter("lang")%>";
			var players = "<%= request.getParameter("players")%>";
			var attn = languageSet.next_player;
			var attnQuirk = languageSet.next_quirk;
			var attnEnd = languageSet.the_end;
			var home = languageSet.new_game;
			
			var i = 0;
			var bool = true;
			var getQuirks = "<%= operations.getQuirks(request.getParameter("lang"), request.getParameter("players"))%>";
			
			var quirks = getQuirks.split(";");
			
			document.getElementById("button").innerHTML = attnQuirk;
			document.getElementById("button2").innerHTML = home;
		
			function nextPlayer() {
				if (i < players) {
					if (bool) {
						document.getElementById("button").innerHTML = attn;
						document.getElementById("play").innerHTML = quirks[i];
						i = i + 1;
						bool = false;
					} else {
						document.getElementById("button").innerHTML = attnQuirk;
						document.getElementById("play").innerHTML = "";
						bool = true;
					}
				} else {
					document.getElementById("button").innerHTML = attnEnd;
					document.getElementById("play").innerHTML = "";
				}
			}
			function submitForm() {
				document.getElementById("lang").value = lang;
				document.getElementById("form").submit();
			}
		</script>
	</body>
</html>

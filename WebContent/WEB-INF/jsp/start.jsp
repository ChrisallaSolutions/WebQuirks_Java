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
<script type="text/javascript" src="resources/js/main.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<meta charset="UTF-8">
<title>WebQuirks</title>

</head>
<body>
<div >
		<button id="button" onclick="nextPlayer()"></button>
		<div id="play"></div><a href="/WebQuirks"><button id="button2"></button></a>
	</div>
<script>
	var lang = "<%= request.getParameter("lang")%>";
	var players = "<%= request.getParameter("players")%>";
	var attn = (lang == "de")? "nächster Spieler" : "next player";
	var attnQuirk = (lang == "de")? "zeige nächsten Tick" : "show next quirk";
	var attnEnd = (lang == "de")? "Ende" : "The end";
	var home = (lang == "de")? "Neues Spiel" : "New game";
	
	var i = 0;
	var bool = true;
	var getQuirks = "<%= operations.getQuirks(request.getParameter("lang"), request.getParameter("players"))%>";
	console.log(getQuirks);

	var quirks = getQuirks.split(";");
	console.log(quirks);
	
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
	
</script>
	
	
</body>
</html>
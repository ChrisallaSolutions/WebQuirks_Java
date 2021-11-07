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
<script>
var init = "<%= operations.getQuirks("de", "1")%>";
var html = "<%= operations.textChoose%>\n";
html = html + '<form action="start" method="POST">\n';
html = html + '<input type="number" placeholder="1" min="1" name="players">\n';
html = html + '<select name="lang">\n';
html = html + '<option>de</option>\n';
html = html + '<option>en</option>\n';
html = html + '</select> <input type="submit" value="Go!">\n';
html = html + '</form>\n';

</script>
</head>
<body>
<div id="menu"></div>
<script>
		
document.getElementById('menu').innerHTML = html;
</script>
	
	
</body>
</html>
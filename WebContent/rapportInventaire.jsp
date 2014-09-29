<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="exemple.xml" varReader="fichier">
	<x:parse doc="${fichier }" var="fichierParse" />
	<!-- Lister chaque livres presents -->
		Livres disponibles:
		<ul>
		<x:forEach select="$fichierParse/inventaire/livre" var="data" varStatus="dataState">
			<li>Livre n <c:out value="${dataState.count }"></c:out></li>
			<ul>
				<li><x:out select="$data/auteur"/></li>
				<li><x:out select="$data/titre"/></li>
				<li><x:out select="$data/date"/></li>
				<li><x:out select="$data/prix"/></li>
				<li><x:out select="$data/stock"/></li>
				<li><x:out select="$data/minimum"/></li>
			</ul><br/>
		</x:forEach>
		</ul>
	<!-- Afficher un message d'alerte pour chaque livre dont le stock est en dessous de la quantite min -->
	
	<!-- Lister les livres triés par stock decroissant -->
</c:import>
</body>
</html>
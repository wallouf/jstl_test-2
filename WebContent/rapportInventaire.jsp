<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<li>Auteur: <x:out select="$data/auteur"/></li>
				<li>Titre: <x:out select="$data/titre"/></li>
				<li>Date: <x:out select="$data/date"/></li>
				<li>Prix: <x:out select="$data/prix"/></li>
				<li>Stock: <x:out select="$data/stock"/></li>
				<li>Minimum: <x:out select="$data/minimum"/></li>
				<x:if select="$data/stock < $data/minimum"><strong>Attention, niveau bas!</strong></x:if>
			</ul><br/>
		</x:forEach>
		</ul>
	<!-- Afficher un message d'alerte pour chaque livre dont le stock est en dessous de la quantite min -->
	<p><b>Liste des livres qu'il faut réapprovisionner :</b></p>
<div>
	<ul>
	<%-- Parcours du document parsé pour y récupérer chaque nœud "livre"
	    dont le contenu du nœud "stock" est inférieur au contenu du nœud
	    "minimum". --%>
	<x:forEach var="livre" select="$fichierParse/inventaire/livre[stock < minimum]">
	    <%-- Affichage des titres, stocks et minimaux du livre récupéré. --%>
	    <li><x:out select="$livre/titre" /> : <x:out select="$livre/stock" /> livres en stock (limite avant alerte : <x:out select="$livre/minimum" />)</li>
	</x:forEach>
	</ul>
</div>
	<!-- Lister les livres triés par stock decroissant -->
	
	
	<!-- Impossible ici sinon on ne respecte pas le modele MVC -->
</c:import>
</body>
</html>
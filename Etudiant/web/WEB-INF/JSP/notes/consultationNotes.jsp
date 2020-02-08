<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<%-- USEBEAN --%>
<%--
<jsp:useBean id="listeNotesEtudiants" type="java.util.Map<projet.data.Etudiant,java.lang.Integer>" scope="request"/>
--%>
<jsp:useBean id="listeNotesEtudiants" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>


	<!--% ou en JAVA
	Map<Etudiant,Integer> listeNotesEtudiants = (Map<Etudiant,Integer>)request.getAttribute("listeNotesEtudiants");
	%-->

<div style="background-color:#D8F6CE">
	<!-- AFFICHAGE d'un titre  -->
	<h3>Consultations notes</h3>

		<!-- AFFICHAGE des notes des étudiants  -->
		<%--
			<% if (listeNotesEtudiants.size() != 0) {%>
		--%>

		<!-- afficher notes  -->
	<table border="1">
		<%
			for (Etudiant etudiant : listeNotesEtudiants) {
		%>
			<tr>
				<td> <%=etudiant.getPrenom() + " " + etudiant.getNom()%></td>
			</tr>
			<tr>
				<td for="MoyenneGenerale">Moyenne Generale</td>
				<td type="text" id="MoyenneGenerale"><%=etudiant.getMoyenneGenerale()%></td>
			</tr>
	<% }%>
	</table>
</div>
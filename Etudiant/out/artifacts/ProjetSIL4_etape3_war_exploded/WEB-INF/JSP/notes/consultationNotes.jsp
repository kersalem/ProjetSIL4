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

<div class="container">
	<div class="row">
		<div class="col-6">
			<!-- AFFICHAGE d'un titre  -->
			<h3>Consultations notes</h3>

				<!-- afficher notes  -->
			<table class="table table-striped table-dark">
				<%
					int moyenneGenerale = 0;
					int nbEtudiant = 0;
					for (Etudiant etudiant : listeNotesEtudiants) {
				%>
					<tr>
						<td> <%=etudiant.getPrenom() + " " + etudiant.getNom()%></td>
						<td type="text" id="MoyenneGenerale"><%=etudiant.getMoyenneGenerale()%></td>
					</tr>
				<%
					nbEtudiant++;
					moyenneGenerale += etudiant.getMoyenneGenerale();
				%>
				<% }%>
			</table>
			<%
				moyenneGenerale = moyenneGenerale / nbEtudiant;
			%>
			<div>Moyenne générale : <%=moyenneGenerale%></div>
		</div>
	</div>
</div>
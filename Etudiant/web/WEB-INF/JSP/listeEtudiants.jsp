<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<%-- USEBEAN --%>
<jsp:useBean id="listeEtudiants" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>

<div class="container">
	<div class="row">
		<div class="col-6">
			<!-- AFFICHAGE d'un titre  -->
			<h3>Liste des étudiants</h3>

			<!-- AFFICHAGE des notes des étudiants  -->
			<% if (listeEtudiants.size() != 0) {%>
			<form method="post">
			<!-- tableau de notes  -->
				<table class="table table-striped table-dark">
					<thead>
						<tr>
							<th scope="col">Nom</th>
							<th scope="col">Groupe</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<%
						for (Etudiant etudiant : listeEtudiants) {
						%>
							<tr>
								<td><a class="nav-item nav-link text-white" href="<%= application.getContextPath()%>/do/etudiant?id=<%=etudiant.getId()%>"><%=etudiant.getPrenom()%> <%=etudiant.getNom()%></a></td>
								<td><a class="nav-item nav-link text-white" href="<%= application.getContextPath()%>/do/ficheGroupes?id=<%=etudiant.getGroupe().getId()%>"><%=etudiant.getGroupe().getNom()%></a></td>
								<td><button type="submit" class="btn btn-primary"> X </button></td>
							</tr>
						<%
						}
						%>
					<tbody>
				</table>
			</form>
			<% } else {%>

				<p>Aucun étudiant</p>
			<%}%>
		</div>
	</div>
</div>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
<jsp:useBean id="modofierMoyenneG" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>
--%>

<jsp:useBean id="etudiant" class="projet.data.Etudiant" scope="request"/>
<jsp:useBean id="nbAbsences" type="java.lang.Integer" scope="request"/>
<jsp:useBean id="note" type="java.lang.Integer" scope="request"/>

<div class="container">
	<div class="row">
		<div class="col-10">

			<h3>Fiche <%=etudiant.getPrenom()%> <%=etudiant.getNom()%></h3>
			<form method="post">

			<table class="table table-striped table-dark">
				<tr>
					<th>Nom</th>
					<td><input class="form-control" type="text" id="nom" name="nom" value="<%=etudiant.getNom()%>"></td>
				</tr>
				<tr>
					<th>Prénom</th>
					<td><input class="form-control" type="text" id="prenom" name="prenom" value="<%=etudiant.getPrenom()%>"></td>
				</tr>
				<tr>
					<th>Groupe</th>
					<td><input class="form-control" type="text" id="groupe" name="groupe" value="<%=etudiant.getGroupe().getNom()%>"></td>

				</tr>
				<tr>
					<th>Moyenne Générale</th>
					<td><input class="form-control" type="int" id="MoyenneGenerale" name="moyenne" value="<%=etudiant.getMoyenneGenerale()%>"></td>
				</tr>
				<tr>
					<th>Absences</th>
					<td><input class=" form-control" type="int" id="nbAbsences" name="absence" value="<%=etudiant.getNbAbsences()%>"></td>
				</tr>
			</table>
				<button type="submit" class="btn btn-primary">Enregistrer</button>
			</form>
		</div>
	</div>
</div>
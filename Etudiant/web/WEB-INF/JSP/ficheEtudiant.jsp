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
		<div class="col-6">

			<h3>Fiche <%=etudiant.getPrenom()%> <%=etudiant.getNom()%></h3>

			<table class="table table-striped table-dark">
				<tr>
					<th>Groupe</th>
					<td><%=etudiant.getGroupe().getNom()%></td>
				</tr>
				<tr>
					<th>Moyenne Générale</th>
					<td><%=note%></td>
				</tr>
				<tr>
					<th>Absences</th>
					<td><%=etudiant.getNbAbsences()%></td>
				</tr>
			</table>
			<div class="btn-group" role="group">
				<form method="post">
					<div class="form-group">
						<label for="MoyenneGenerale">Modifier moyenne générale</label>
						<input class="form-control" type="text" id="MoyenneGenerale" name="moyenne" value="<%=etudiant.getMoyenneGenerale()%>">

						<input type="hidden" name="id" value="<%=etudiant.getId()%>">
						<br />

						<label>Modifier nombre d'absence(s)</label>
						<input class=" form-control" type="text" id="nbAbsences" name="absence" value="<%=etudiant.getNbAbsences()%>">

					</div>
					<button type="submit" class="btn btn-primary">Enregistrer</button>
				</form>
			</div>
		</div>
	</div>
</div>
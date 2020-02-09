<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:useBean id="etudiant" class="projet.data.Etudiant" scope="request"/>
<jsp:useBean id="nbAbsences" type="java.lang.Integer" scope="request"/>
<jsp:useBean id="note" type="java.lang.Integer" scope="request"/>

<div class="container">
	<div class="row">
		<div class="col-6">

			<h3>Fiche de <%=etudiant.getPrenom()%> <%=etudiant.getNom()%></h3>

			<table class="table table-striped table-dark">
				<tr>
					<td>Groupe</td>
					<td><%=etudiant.getGroupe().getNom()%></td>
				</tr>
				<tr>
					<td>Moyenne Generale</td>
					<td><%=note%></td>
				</tr>
				<tr>
					<td>Absences</td>
<%--					<td><%=nbAbsences%></td>--%>
					<td><%=etudiant.getNbAbsences()%></td>
				</tr>
			</table>
			<%--<div class="btn-group" role="group">
				<a class="btn btn-primary" href="<%= application.getContextPath()%>/do/enleverAbsencesEtudiant?id=<%=etudiant.getId()%>"> Enlever absences </a>
				<a class="btn btn-primary" href="<%= application.getContextPath()%>/do/ajouterAbsencesEtudiant?id=<%=etudiant.getId()%>"> Ajouter absences </a>
			</div>--%>
			<div class="btn-group" role="group">
				<form>
					<div class="form-group">
						<label for="MoyenneGenerale">Moyenne Generale</label>
						<input class="form-control" type="text" id="MoyenneGenerale" name="<%=etudiant.getId()%>" value="<%=etudiant.getMoyenneGenerale()%>">
					</div>
					<button type="submit" class="btn btn-primary">Enregistrer</button>
				</form>
			</div>
		</div>
	</div>
</div>
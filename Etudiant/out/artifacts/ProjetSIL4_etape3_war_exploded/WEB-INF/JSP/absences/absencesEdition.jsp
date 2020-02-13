<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- IMPORT --%>
<%@ page import="projet.data.Etudiant"%>

<%-- USEBEAN --%>
    <jsp:useBean id="absencesEdition" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>

<div class="container">
    <div class="row">
        <div class="col-6">

            <h3>Editer absences</h3>
            <form method="post">
            <table class="table table-striped table-dark">
                <tr>
                    <th>Nom / Prénom</th>
                    <th>Nombre absences</th>
                </tr>
                <%
                    for (Etudiant etudiant : absencesEdition) {
                %>
                    <tr>
                        <td class="col-4" style="vertical-align:middle;"><%=etudiant.getPrenom() + " " + etudiant.getNom()%></td>
                        <td>
                            <div style="margin:0 10px; display: flex; flex-direction: row;">
                                <a class="btn btn-primary" href="<%= application.getContextPath()%>/do/enleverAbsences?id=<%=etudiant.getId()%>"> - </a>
                                <input class="form-control" type="text" id="nbAbsences" name="<%=etudiant.getId()%>" value="<%=etudiant.getNbAbsences()%>">
                                <a class="btn btn-primary" href="<%= application.getContextPath()%>/do/ajouterAbsences?id=<%=etudiant.getId()%>"> + </a>
                            </div>
                        </td>
                   </tr>
                <%}%>
                <button type="submit" class="btn btn-primary">Enregistrer</button>
                <br />
            </table>
            </form>
        </div>
    </div>
</div>

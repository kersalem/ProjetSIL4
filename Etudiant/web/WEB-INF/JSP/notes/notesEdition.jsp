<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<%-- USEBEAN --%>
<jsp:useBean id="notesEdition" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>
<div class="container">
    <div class="row">
        <div class="col-6">

            <h3>Editer notes</h3>
            <form method="post">
                <table class="table table-striped table-dark">
                    <tr>
                        <th>Nom / Prénom</th>
                        <th>Moyenne générale</th>
                    </tr>
                    <%
                        for (Etudiant etudiant : notesEdition) {
                    %>
                     <tr>
                        <td class="col-4" style="vertical-align:middle;"><%=etudiant.getPrenom() + " " + etudiant.getNom()%></td>
                        <td>
                            <input class="form-control" type="number" id="MoyenneGenerale" name="<%=etudiant.getId()%>" value="<%=etudiant.getMoyenneGenerale()%>">
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
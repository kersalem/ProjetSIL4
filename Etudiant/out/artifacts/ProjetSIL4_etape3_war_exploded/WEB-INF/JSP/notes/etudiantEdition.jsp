<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<%-- USEBEAN --%>
<jsp:useBean id="etudiantEdition" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>
<div class="container">
    <div class="row">
        <div class="col-6">
            <h3>Editer notes</h3>
            <form method="post" class="col-sm form-group">
                <%
                    for (Etudiant etudiant : etudiantEdition) {
                %>
                    <hr>

                    <div class="form-group">
                        <p><%=etudiant.getPrenom() + " " + etudiant.getNom()%></p>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label" for="MoyenneGenerale">Moyenne Generale</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="number" id="MoyenneGenerale" name="<%=etudiant.getId()%>" value="<%=etudiant.getMoyenneGenerale()%>">
                        </div>
                    </div>
                <%}%>
                <button type="submit" class="btn btn-primary">Enregistrer</button>
            </form>
        </div>
    </div>
</div>

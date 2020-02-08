<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- IMPORT --%>
<%@ page import="projet.data.Etudiant"%>

<%-- USEBEAN --%>
    <jsp:useBean id="absencesEdition" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>

<div>
    <h3>Editer notes</h3>
   <form method="post" class="col-sm form-group">
        <%
            for (Etudiant etudiant : absencesEdition) {
        %>
        <hr>
       <div class="form-group">
            <p> <%=etudiant.getPrenom() + " " + etudiant.getNom()%></p>
        </div>
       <% System.out.println( "je suis dans jsp edition absences"); %>
       <div class="form-group">
            <label for="nbAbsences">Absences</label>
            <input class="form-control" type="text" id="nbAbsences" name="<%=etudiant.getId()%>" value="<%=etudiant.getNbAbsences()%>">
       </div>
        <%}%>
        <button type="submit" class="btn btn-primary">Enregistrer</button>
    </form>
</div>
<blockquote>je suis absencesEdition.jsp</blockquote>

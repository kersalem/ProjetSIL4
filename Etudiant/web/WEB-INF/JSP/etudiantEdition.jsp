<%--
  Created by IntelliJ IDEA.
  User: kersalem
  Date: 30/01/2020
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<jsp:useBean id="etudiant" type="projet.data.Etudiant" scope="request" />
<%-- USEBEAN --%>
<jsp:useBean id="etudiantEdition" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>


<div>
    <h2>Editer <%=etudiant.getPrenom() + " " + etudiant.getNom()%></h2>

    <form method="post">
        <div>
            <label for="prenom">Prenom</label>
            <input type="text" id="prenom" name="prenom" value="<%=etudiant.getPrenom()%>">
        </div>
        <div>
            <label for="prenom">Nom</label>
            <input type="text" id="Nom" name="Nom" value="<%=etudiant.getNom()%>">
        </div>
        <div>
            <label for="NbAbsences">Nb Absences</label>
            <input type="text" id="NbAbsences" name="NbAbsences" value="<%=etudiant.getNbAbsences()%>">
        </div>
        <div>
            <label for="MoyenneGenerale">Moyenne Generale</label>
            <input type="text" id="MoyenneGenerale" name="MoyenneGenerale" value="<%=etudiant.getMoyenneGenerale()%>">
        </div>

        <button type="submit" class="btn btn-primary">Enregistrer</button>
    </form>
</div>

<blockquote>je suis etudiantEdition.jsp</blockquote>
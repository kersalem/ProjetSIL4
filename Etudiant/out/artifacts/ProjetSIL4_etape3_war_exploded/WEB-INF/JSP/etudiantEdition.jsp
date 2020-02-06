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

<%-- USEBEAN --%>
<jsp:useBean id="etudiantEdition" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>


<div>
    <form method="post" >
    <%
        for (Etudiant etudiant : etudiantEdition) {
    %>
<hr>
        <div>
            <p> <%=etudiant.getPrenom() + " " + etudiant.getNom()%></p>
        </div>
<%--        <div>--%>
<%--            <p><%=etudiant.getNbAbsences()%></p>--%>
<%--        </div>--%>
        <div>
            <label for="MoyenneGenerale">Moyenne Generale</label>
            <input type="text" id="MoyenneGenerale" name="<%=etudiant.getId()%>" value="<%=etudiant.getMoyenneGenerale()%>">
        </div>
        <%}%>
        <button type="submit" class="btn btn-primary">Enregistrer</button>
    </form>
</div>

<blockquote>je suis etudiantEdition.jsp</blockquote>
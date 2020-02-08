<%@ page import="projet.data.Groupe" %>
<%@ page import="projet.data.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
<jsp:useBean id="groupeTest" class="projet.data.Groupe" scope="request"/>
<jsp:useBean id="etudiant" class="projet.data.Etudiant" scope="request"/>
<jsp:useBean id="etudiants" class="java.lang.String" scope="request"/>--%>
<jsp:useBean id="ficheGroupes" type="java.util.Collection<projet.data.Groupe>" scope="request"/>


<div style="background-color:#D8F6CE">
    <!-- AFFICHAGE en fonction du groupe ou de ALL  -->
<%--
    <h3>Détails de  <%=groupe.getNom()%></h3>
--%>

    <table border="1">
        <% System.out.println( "je suis dans jsp fiche groupe"); %>

            <%--<td>etu === <%=etudiants%></td>--%>
    <%
        for (Groupe groupe : ficheGroupes) {
    %>
        <tr>
         <%--   <td><%=groupe.getNom()%></td>
            <td><%=groupeTest.getNom()%></td>--%>

            <td><%=groupe.getEtudiants()%></td>
        </tr>
    </table>
    <%
        }
    %>
</div>
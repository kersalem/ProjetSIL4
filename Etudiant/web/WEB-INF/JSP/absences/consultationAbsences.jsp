<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<%-- USEBEAN --%>
<jsp:useBean id="listeAbsencesEtudiants" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>

    <div style="background-color:#D8F6CE">
        <!-- AFFICHAGE en fonction du groupe ou de ALL  -->
        <h3>Consultation des absences</h3>

        <!-- tableau de notes  -->
        <table border="1">
        <%
            for (Etudiant etudiant : listeAbsencesEtudiants) {
        %>
            <tr>
                <td> <%=etudiant.getPrenom() + " " + etudiant.getNom()%></td>
            </tr>
            <tr>
               <td>Nombre absences</td>
               <td><%=etudiant.getNbAbsences()%></td>
            </tr>
        <%}%>
        </table>
    </div>
<blockquote>je suis constulationAbsences.jsp</blockquote>
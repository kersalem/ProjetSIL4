<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<%-- USEBEAN --%>
<jsp:useBean id="listeAbsencesEtudiants" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>

<div class="container">
    <div class="row">
        <div class="col-12 justify-content-end">
            <!-- AFFICHAGE en fonction du groupe ou de ALL  -->
            <h3>Consultation des absences</h3>

            <!-- tableau de notes  -->
            <table class="table table-striped table-dark">
                <thead>
                <tr>
                    <th scope="col">Nom</th>
                    <th scope="col">Absences</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        int totalAbsences = 0;
                        for (Etudiant etudiant : listeAbsencesEtudiants) {
                    %>
                        <tr>
                            <td><%=etudiant.getPrenom() + " " + etudiant.getNom()%></td>
                           <td><%=etudiant.getNbAbsences()%></td>
                        </tr>
                        <%
                            totalAbsences += etudiant.getNbAbsences();
                        %>
                    <%}%>
                <tbody>
            </table>
            <h4>Total de <%=totalAbsences%> absences</h4>
        </div>
    </div>
</div>
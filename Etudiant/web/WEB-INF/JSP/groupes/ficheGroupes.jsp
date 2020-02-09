<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="projet.data.Groupe" %>
<%@ page import="projet.data.*"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="groupe" class="projet.data.Groupe" scope="request"/>

<div class="container">
    <div class="row">
        <div class="col-12 ">
            <!-- AFFICHAGE en fonction du groupe ou de ALL  -->

            <h3>Détails de  <%=groupe.getNom()%></h3>

            <table class="table table-striped table-dark">
                <% System.out.println( "je suis dans jsp fiche groupe"); %>
                <%
                    int sommeMoyenneGenerale = 0;
                    for (Etudiant etudiant : groupe.getEtudiants()) {
                %>
                <tr>

                    <td><%=etudiant.getNom()%></td>

                </tr>
                <%
                    }
                %>
            </table>

            <%--<td><%=etudiants%></td>
            <td><%=etudiants.getNom()%></td>
            <td><%=etudiants.getGroupe()%></td>--%>
        </div>
    </div>
</div>
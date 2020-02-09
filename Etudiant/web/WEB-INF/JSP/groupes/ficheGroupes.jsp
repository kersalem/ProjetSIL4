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
                <tr>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Absences</th>
                    <th>Moyenne générale</th>
                </tr>
                <% System.out.println( "je suis dans jsp fiche groupe"); %>
                <%
                    int totalAbsences = 0;
                    int moyenneGenerale = 0;
                    int nbEtudiant = 0;
                    for (Etudiant etudiant : groupe.getEtudiants()) {
                %>
                <tr>
                    <td class="col-3"><%=etudiant.getNom()%></td>
                    <td class="col-3"><%=etudiant.getPrenom()%></td>
                    <td><form method="post">
                        <input class="form-control col-2" type="text" id="nbAbsences" name="absence" value="<%=etudiant.getNbAbsences()%>">
                    </form></td>
                    <td><form method="post">
                        <input class="form-control col-2" type="text" id="moyenne" name="moyenne" value="<%=etudiant.getMoyenneGenerale()%>">
                    </form></td>
                </tr>
                <%
                    totalAbsences += etudiant.getNbAbsences();
                    nbEtudiant++;
                    moyenneGenerale += etudiant.getMoyenneGenerale();
                %>
                <%
                    }
                %>
            </table>
            <%
                moyenneGenerale = moyenneGenerale / nbEtudiant;
            %>
            <h3>Moyenne générale : <%=moyenneGenerale%> /20</h3>
            <h4>Total de <%=totalAbsences%> absences</h4>
            <br />
            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </div>
    </div>
</div>
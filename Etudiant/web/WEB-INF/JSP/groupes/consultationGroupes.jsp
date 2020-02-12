<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="projet.data.Groupe" %>
<jsp:useBean id="listeGroupes" type="java.util.Collection<projet.data.Groupe>" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <div class="row">
        <div class="col-12 ">
            <!-- AFFICHAGE en fonction du groupe ou de ALL  -->
            <h3 class="ml-4">Liste des groupes</h3>

            <!-- tableau de notes  -->
            <table class="table table-striped table-dark">
                <%
                    for (Groupe groupe : listeGroupes) {
                %>
                <tr>
                    <td><a class="nav-item nav-link text-white" href="<%= application.getContextPath()%>/do/ficheGroupes?id=<%=groupe.getId()%>"><%=groupe.getNom()%></a></td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
<%--        <h3 class="ml-4">Création d'un groupe</h3>
        <div class="col-12 ">
            <form method="post">
                <div class="form-group">
                    <label for="nom">Nom</label>
                    <input type="text" class="form-control" id="nom" name="nom">
                </div>
                <button type="submit" class="btn btn-primary">Créer</button>
            </form>
        </div>--%>
</div>

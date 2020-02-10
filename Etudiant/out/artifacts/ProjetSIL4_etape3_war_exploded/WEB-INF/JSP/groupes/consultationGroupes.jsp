<%@ page import="projet.data.Groupe" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="listeGroupes" type="java.util.Collection<projet.data.Groupe>" scope="request"/>

<div class="container">
    <div class="row">
        <div class="col-12 ">
            <!-- AFFICHAGE en fonction du groupe ou de ALL  -->
            <h3>Liste des groupes</h3>

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
</div>

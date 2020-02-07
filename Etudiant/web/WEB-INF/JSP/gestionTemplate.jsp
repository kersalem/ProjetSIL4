<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="content" class="java.lang.String" scope="request"/>

<html>
<head>
<title><%= application.getInitParameter("title")%></title>
</head>
<style>
    body {
        margin: auto;
        width: 960px;
        background-color: darkkhaki;
    }
    .editEtudiant {
        background-color: darkorange;
    }
</style>
<body>

    <a href="<%= application.getContextPath()%>/do/accueil">Accueil</a>
    <a href="<%= application.getContextPath()%>/do/listeEtudiants">Les étudiants</a>
    <a href="<%= application.getContextPath()%>/do/consultationNotes">Consulter les notes</a>
    <a href="<%= application.getContextPath()%>/do/etudiantEdition">Editer notes</a>
    <a href="<%= application.getContextPath()%>/do/consultationAbsences">Consulter absences</a>
<%--
    <a href="<%= application.getContextPath()%>/do/abscencesEdition">Editer abscences</a>
--%>

    <jsp:include page="<%=content%>" />

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>

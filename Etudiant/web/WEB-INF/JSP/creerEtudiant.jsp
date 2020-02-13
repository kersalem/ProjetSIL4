<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="projet.data.Groupe" %>
<jsp:useBean id="groupes" type="java.util.List<projet.data.Groupe>" scope="request" />

<div class="container">
    <div class="row">
        <div class="col-12 ">
            <h3 class="ml-4">Création d'un étudiant</h3>
            <div class="container">
                <form method="post">
                    <div class="form-group">
                        <label for="nom">Nom</label>
                        <input type="text" class="form-control" id="nom" name="nom">
                    </div>
                    <div class="form-group">
                        <label for="prenom">Prenom</label>
                        <input type="text" class="form-control" id="prenom" name="prenom">
                    </div>
                    <div class="form-group">
                        <label for="groupe">Groupe</label>
                        <select class="form-control" name="groupe" id="groupe">
                            <%for (Groupe groupe : groupes) {%>
                            <option value="<%=groupe.getId()%>"><%=groupe.getNom()%></option>
                            <%}%>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Créer</button>
                </form>
            </div>
        </div>
    </div>
</div>
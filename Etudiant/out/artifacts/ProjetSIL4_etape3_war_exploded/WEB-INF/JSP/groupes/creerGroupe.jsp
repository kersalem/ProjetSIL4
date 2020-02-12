<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="projet.data.Groupe" %>
<jsp:useBean id="creerGroupe" type="java.util.Collection<projet.data.Groupe>" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="container">
    <div class="row">
        <div class="col-12 ">
            <h3 class="ml-4">Création d'un groupe</h3>
            <div class="col-12 ">
                <form method="post">
                    <div class="form-group">
                        <label for="nom">Nom</label>
                        <input type="text" class="form-control" id="nom" name="nom">
                    </div>
                    <button type="submit" class="btn btn-primary">Créer</button>
                </form>
            </div>
        </div>
    </div>
</div>
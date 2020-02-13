/**
 * 
 */
package projet.controleur;

/**
 * @author hb
 *
 */
import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projet.data.*;

@SuppressWarnings("serial")
public class Controleur extends HttpServlet {

	// private String urlTest;
	private String urlGestionTemplate;
	private String urlAccueil;
	private String urlListeEtudiants;
	private String urlEtudiant;
	private String urlConsultationAbsences;
	private String urlConsultationNotes;
	private String urlAbsencesEdition;
	private String urlConsultationGroupes;
	private String urlFicheGroupe;
	private String urlNotesEdition;
	private String urlCreerEtudiant;
	private String urlCreerGroupes;


	// INIT
	public void init() throws ServletException {
		GestionFactory.open();
		// Récupération des URLs en paramètre du web.xml
		urlGestionTemplate = getServletConfig().getInitParameter("urlGestionTemplate");
		urlAccueil = getServletConfig().getInitParameter("urlAccueil");
		urlListeEtudiants = getServletConfig().getInitParameter("urlListeEtudiants");
		urlEtudiant = getServletConfig().getInitParameter("urlEtudiant");
		urlConsultationAbsences = getServletConfig().getInitParameter("urlConsultationAbsences");
		urlConsultationNotes = getServletConfig().getInitParameter("urlConsultationNotes");
		urlNotesEdition = getServletConfig().getInitParameter("urlNotesEdition");
		urlAbsencesEdition = getServletConfig().getInitParameter("urlAbsencesEdition");
		urlConsultationGroupes = getServletConfig().getInitParameter("urlConsultationGroupes");
		urlFicheGroupe = getServletConfig().getInitParameter("urlFicheGroupe");
		urlCreerEtudiant = getServletConfig().getInitParameter("urlCreerEtudiant");
		urlCreerGroupes = getServletConfig().getInitParameter("urlCreerGroupes");
		// GroupeDAO.create("SIMO");
	}

	@Override
	public void destroy() {
		super.destroy();
		GestionFactory.close();
	}

	// POST
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		// Traiter les caractères spéciaux
		request.setCharacterEncoding("UTF-8");

		System.out.println("DOPOST");
		String action = request.getPathInfo();
		if (action == null)
		{
			action = "/accueil";
		}
		// on passe la main au GET
		if (action.equals("/notesEdition")) { // editer notes
			doNotesEditionPost(request, response);

		} else if (action.equals("/absencesEdition")) { // editer absecence
			doAbsencesEditionPost(request, response);

		} else if (action.equals("/etudiant")) { //editer etudiant
			doModifierMoyennePost(request, response);

		} else if (action.equals("/ficheGroupe")) { // editer notes et absences à partir d'un groupe
			doFicheGroupePost(request, response);

		}else {
			// Autres cas
			System.out.println("DOGET FROM DOPOST");
			doGet(request, response);
		}
	}

	// SUPPRIMER
	/*	public void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("DODELETE");
		String action = request.getPathInfo();
		if (action == null) {
			action = "/accueil";
		}

	}*/

	private void doNotesEditionPost(HttpServletRequest request, HttpServletResponse response) {

		Collection<Etudiant> etudiants = EtudiantDAO.getAll();

		for(Etudiant etudiant : etudiants) {
			String noteEnString = request.getParameter(etudiant.getId().toString());
			int noteEnNumber = Integer.parseInt(noteEnString);
			etudiant.setMoyenneGenerale(noteEnNumber);
			EtudiantDAO.update(etudiant);
		}
		try {
			doNotesEdition(request, response);

		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doModifierMoyennePost (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int idEtudiant = Integer.parseInt(request.getParameter("id"));

		Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);

		int moyenne = Integer.parseInt(request.getParameter("moyenne"));
		int absence = Integer.parseInt(request.getParameter("absence"));
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");

		etudiant.setMoyenneGenerale(moyenne);
		etudiant.setNbAbsences(absence);
		etudiant.setNom(nom);
		etudiant.setPrenom(prenom);

		EtudiantDAO.update(etudiant);

		try {
			doEtudiant(request, response);

		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	private void doFicheGroupePost(HttpServletRequest request, HttpServletResponse response) {

		Collection<Etudiant> etudiants = EtudiantDAO.getAll();

		for(Etudiant etudiant : etudiants) {

			if(
				request.getParameter(etudiant.getId()+"-absence") != null &&
				request.getParameter(etudiant.getId()+"-moyenne") != null
			) {
				int absence = Integer.parseInt(request.getParameter(etudiant.getId()+"-absence"));
				float moyenne = Float.parseFloat(request.getParameter(etudiant.getId()+"-moyenne"));
				etudiant.setNbAbsences(absence);
				etudiant.setMoyenneGenerale(moyenne);
				EtudiantDAO.update(etudiant);
			}
		}

		try {
			doFicheGroupe(request, response);

		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	private void doAbsencesEditionPost(HttpServletRequest request, HttpServletResponse response) {

		Collection<Etudiant> etudiants = EtudiantDAO.getAll();

		for(Etudiant etudiant : etudiants) {
			String absencesEnString = request.getParameter(etudiant.getId().toString());
			int absencesEnNumber = Integer.parseInt(absencesEnString);
			etudiant.setNbAbsences(absencesEnNumber);
			EtudiantDAO.update(etudiant);
		}
		try {
			doAbsencesEdition(request, response);

		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// GET
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		// On récupère le path
		String action = request.getPathInfo();
		if (action == null) {
			action = "/accueil";
		}
		System.out.println("DOGET");
		System.out.println(action);
		// Exécution action
		if (action.equals("/accueil")) {
			doAcceuil(request, response);
		} else if (action.equals("/listeEtudiants")) {
			doListeEtudiants(request, response);
		} else if (action.equals("/etudiant")) {
			doEtudiant(request, response);
		} else if (action.equals("/consultationAbsences")) {
			doConsultationAbsences(request, response);
		} else if (action.equals("/consultationNotes")) {
			doConsultationNotes(request, response);
		} else if (action.equals("/notesEdition")) {
			doNotesEdition(request, response);
		} else if (action.equals("/absencesEdition")) {
			doAbsencesEdition(request, response);
		} else if (action.equals("/consultationGroupes")) {
			doConsultationGroupes(request, response);
		}else if (action.equals("/ficheGroupe")) {
			doFicheGroupe(request, response);
		} else if (action.equals("/ajouterAbsences")) {
			doAddAbsences(request, response);
		}else if (action.equals("/enleverAbsences")) {
			doEnleverAbsences(request, response);
		}else if (action.equals("/creerEtudiant")) {
			doCreerEtudiant(request, response);
		}else if (action.equals("/supprimerEtudiant")) {
			doSupprimerEtudiant(request, response);
		} /*else if (action.equals("/creerGroupe")) {
			doCreerGroupes(request, response);
		}else if (action.equals("/supprimerGroupe")) {
			doSupprimerGroupe(request, response);
		} */else {
			// Autres cas
			doAcceuil(request, response);
		}
	}

	// ACCUEIL
	private void doAcceuil(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Inclusion du content dans le template
		request.setAttribute("content", urlAccueil);
		loadJSP(urlGestionTemplate, request, response);
	}

	// LISTE ETUDIANTS
	private void doListeEtudiants(HttpServletRequest request,
								  HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants
		Collection<Etudiant> listeEtudiants = EtudiantDAO.getAll();

		// Mettre les étudians en attibuts de request
		request.setAttribute("listeEtudiants", listeEtudiants);

		request.setAttribute("content", urlListeEtudiants);
		loadJSP(urlGestionTemplate, request, response);
	}

	// FICHE DETAILS ETUDIANT
	private void doEtudiant(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Récupérer le parametre id, l'objet Etudiant associé, le nombre d'absences et la moyenne
		int idEtudiant = Integer.parseInt(request.getParameter("id"));
		Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);
		int nbAbsences = etudiant.getNbAbsences();
		int note = etudiant.getMoyenneGenerale();

		// Mettre l'objet étudiant en attribut pour affichage par la vue correspondant
		request.setAttribute("etudiant", etudiant);
		request.setAttribute("nbAbsences", nbAbsences);
		request.setAttribute("note", note);

		request.setAttribute("content", urlEtudiant);
		loadJSP(urlGestionTemplate, request, response);
	}

	// AJOUTER NOUVEL ETUDIANT
	private void doCreerEtudiant(HttpServletRequest request,
								 HttpServletResponse response) throws ServletException, IOException {

		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String groupeId = request.getParameter("groupe");

		if (nom != null && prenom != null && groupeId != null) {
			Groupe groupe = GroupeDAO.retrieveById(Integer.parseInt(groupeId));
			EtudiantDAO.create(nom, prenom, groupe);

			response.sendRedirect(request.getContextPath() + "/do/listeEtudiants");
			return;
		}

		List<Groupe> groupes = GroupeDAO.getAll();
		request.setAttribute("groupes", groupes);

		request.setAttribute("content", urlCreerEtudiant);
		loadJSP(urlGestionTemplate, request, response);
	}

	// SUPPRIMER UN ETUDIANT
	private void doSupprimerEtudiant(HttpServletRequest request,
									 HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("id") != null) {

			int idEtudiant = Integer.parseInt(request.getParameter("id"));
			System.out.println("idEtu///////////////////////:" + idEtudiant);
			EtudiantDAO.remove(idEtudiant);
		}

		response.sendRedirect(request.getContextPath() + "/do/listeEtudiants");
	}

	// LISTE NOTES
	private void doConsultationNotes(HttpServletRequest request,
									 HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants en fonction du filtre groupe
		Collection<Etudiant> listeNotesEtudiants = EtudiantDAO.getAll();

		request.setAttribute("listeNotesEtudiants", listeNotesEtudiants);

		request.setAttribute("content", urlConsultationNotes);
		loadJSP(urlGestionTemplate, request, response);
	}


	// EDITER NOTES
	private void doNotesEdition(HttpServletRequest request,
								HttpServletResponse response) throws ServletException, IOException {

		Collection<Etudiant> notesEdition = EtudiantDAO.getAll();
		request.setAttribute("notesEdition", notesEdition);

		request.setAttribute("content", urlNotesEdition);
		loadJSP(urlGestionTemplate, request, response);
	}

	// EDITER ABSENCES
	private void doAbsencesEdition(HttpServletRequest request,
								   HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants
		Collection<Etudiant> absencesEdition = EtudiantDAO.getAll();

		request.setAttribute("absencesEdition", absencesEdition);

		request.setAttribute("content", urlAbsencesEdition);
		loadJSP(urlGestionTemplate, request, response);
	}

	// AJOUTER ABSENCE
	private void doAddAbsences(HttpServletRequest request,
								   HttpServletResponse response) throws ServletException, IOException {

		int idEtudiant = Integer.parseInt(request.getParameter("id"));

		Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);

		etudiant.ajouterAbsence();

		EtudiantDAO.update(etudiant);

		response.sendRedirect((request.getContextPath() + "/do/absencesEdition"));

	}

	// ENLEVER ABSENCES
	private void doEnleverAbsences(HttpServletRequest request,
							   HttpServletResponse response) throws ServletException, IOException {

		int idEtudiant = Integer.parseInt(request.getParameter("id"));

		Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);
		etudiant.enleverAbsence();

		EtudiantDAO.update(etudiant);

		response.sendRedirect((request.getContextPath() + "/do/absencesEdition"));
	}

	// LISTE ABSENCES
	private void doConsultationAbsences(HttpServletRequest request,
										HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants
		Collection<Etudiant> listeAbsencesEtudiants = EtudiantDAO.getAll();

		request.setAttribute("listeAbsencesEtudiants", listeAbsencesEtudiants);

		request.setAttribute("content", urlConsultationAbsences);
		loadJSP(urlGestionTemplate, request, response);
	}

	// LISTE DES GROUPES
	private void doConsultationGroupes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Collection<Groupe> listeGroupes = GroupeDAO.getAll();

		request.setAttribute("listeGroupes", listeGroupes);

		request.setAttribute("content", urlConsultationGroupes);
		loadJSP(urlGestionTemplate, request, response);
	}

	// DETAILS GROUPE
	private void doFicheGroupe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int idGroupe = Integer.parseInt(request.getParameter("id"));
		Groupe groupe = GroupeDAO.retrieveById(idGroupe);
		request.setAttribute("groupe", groupe);

		request.setAttribute("content", urlFicheGroupe);
		loadJSP(urlGestionTemplate, request, response);
	}

	// NOUVEAU GROUPE
	/*	private void doCreerGroupes(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			System.out.println("**********doCreerGroupes************************");

			String nom = request.getParameter("nom");

			if (nom != null) {
				GroupeDAO.create(nom);
				response.sendRedirect(request.getContextPath() + "/do/consultationGroupes");
				return;
			}
			request.setAttribute("content", urlCreerGroupes);
			loadJSP(urlGestionTemplate, request, response);
	}*/

	/*// SUPPRIMER UN GROUPE
	private void doSupprimerGroupe(HttpServletRequest request,
									 HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("id") != null) {
			int idGroupe = Integer.parseInt(request.getParameter("id"));
			GroupeDAO.remove(idGroupe);
		}

		response.sendRedirect(request.getContextPath() + "/do/ConsultationGroupes");
	}*/

	/**
	 * Charge la JSP indiquée en paramètre
	 * 
	 * @param url
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void loadJSP(String url, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// L'interface RequestDispatcher permet de transférer le contrôle à une
		// autre servlet
		// Deux méthodes possibles :
		// - forward() : donne le contrôle à une autre servlet. Annule le flux
		// de sortie de la servlet courante
		// - include() : inclus dynamiquement une autre servlet
		// + le contrôle est donné à une autre servlet puis revient à la servlet
		// courante (sorte d'appel de fonction).
		// + Le flux de sortie n'est pas supprimé et les deux se cumulent

		ServletContext sc = getServletContext();
		System.out.println(sc.getContextPath());
		RequestDispatcher rd = sc.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}

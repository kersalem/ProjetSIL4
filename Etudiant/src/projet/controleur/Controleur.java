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
import java.util.Map;

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
	private String urlEtudiantEdition;
	private String urlAbsencesEdition;
	private String urlConsultationGroupes;


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
		urlEtudiantEdition = getServletConfig().getInitParameter("urlEtudiantEdition");
		urlAbsencesEdition = getServletConfig().getInitParameter("urlAbsencesEdition");
		urlConsultationGroupes = getServletConfig().getInitParameter("urlConsultationGroupes");
		// EtudiantDAO.create("Marie", "Kersalé");
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
		String action = request.getPathInfo();
		if (action == null) {
			action = "/accueil";
		}
		// on passe la main au GET
		if (action.equals("/etudiantEdition")) {
			doEtudiantEditionPost(request, response);

		} else if (action.equals("/absencesEdition")) {
			doAbsencesEditionPost(request, response);

		} else {
			// Autres cas
			doGet(request, response);
		}
	}

	private void doEtudiantEditionPost(HttpServletRequest request, HttpServletResponse response) {

		Collection<Etudiant> etudiants = EtudiantDAO.getAll();

		for(Etudiant etudiant : etudiants) {
			String noteEnString = request.getParameter(etudiant.getId().toString());
			int noteEnNumber = Integer.parseInt(noteEnString);
			etudiant.setMoyenneGenerale(noteEnNumber);
			EtudiantDAO.update(etudiant);
		}
		try {
			doEtudiantEdition(request, response);

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
		} else if (action.equals("/etudiantEdition")) {
			doEtudiantEdition(request, response);
		} else if (action.equals("/absencesEdition")) {
			doAbsencesEdition(request, response);
		} else if (action.equals("/consultationGroupes")) {
			doConsultationGroupes(request, response);
		}else {
			// Autres cas
			doAcceuil(request, response);
		}
	}

	/////////////////////// ACCUEIL
	private void doAcceuil(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Inclusion du content dans le template
		request.setAttribute("content", urlAccueil);
		loadJSP(urlGestionTemplate, request, response);
	}

	/////////////////////// EDITER Notes

	private void doEtudiantEdition(HttpServletRequest request,
								   HttpServletResponse response) throws ServletException, IOException {

		/*if(request.getMethod().equalsIgnoreCase("post")) {
			System.out.println("LAAAAAAAAAAAA");

		}*/
		Collection<Etudiant> etudiantEdition = EtudiantDAO.getAll();
		request.setAttribute("etudiantEdition", etudiantEdition);

		request.setAttribute("content", urlEtudiantEdition);
		loadJSP(urlGestionTemplate, request, response);
	}

	/////////////////////// EDITER ABSENCES

	private void doAbsencesEdition(HttpServletRequest request,
								   HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants
		Collection<Etudiant> absencesEdition = EtudiantDAO.getAll();
		System.out.println("ICIIIIIIIIIIIIIIIIII editer absence editer");

		if(request.getMethod().equalsIgnoreCase("post")) {
			System.out.println("LAAAAAAAAAAAA");

		}

		request.setAttribute("absencesEdition", absencesEdition);

		request.setAttribute("content", urlAbsencesEdition);
		loadJSP(urlGestionTemplate, request, response);
	}

	// /////////////////////// CONSULTATION NOTES

	private void doConsultationNotes(HttpServletRequest request,
									 HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants en fonction du filtre groupe
		Collection<Etudiant> listeNotesEtudiants = EtudiantDAO.getAll();

		request.setAttribute("listeNotesEtudiants", listeNotesEtudiants);

		request.setAttribute("content", urlConsultationNotes);
		loadJSP(urlGestionTemplate, request, response);
	}

	/////////////////////// CONSULTATION ABSENCES

	private void doConsultationAbsences(HttpServletRequest request,
										HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants
		Collection<Etudiant> listeAbsencesEtudiants = EtudiantDAO.getAll();
		System.out.println("ICIIIIIIIIIIIIIIIIII doConsultationAbsences");

		request.setAttribute("listeAbsencesEtudiants", listeAbsencesEtudiants);

		request.setAttribute("content", urlConsultationAbsences);
		loadJSP(urlGestionTemplate, request, response);
	}

///////////////////////// Détails étudiant

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

	/////////////////////// Liste des étudiants
	private void doListeEtudiants(HttpServletRequest request,
								  HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants
		Collection<Etudiant> listeEtudiants = EtudiantDAO.getAll();

		// Mettre les étudians en attibuts de request
		request.setAttribute("listeEtudiants", listeEtudiants);

		request.setAttribute("content", urlListeEtudiants);
		loadJSP(urlGestionTemplate, request, response);
	}
	///////////////////////// Détails étudiant

	private void doConsultationGroupes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Collection<Groupe> listeGroupes = GroupeDAO.getAll();

		request.setAttribute("listeGroupes", listeGroupes);

		request.setAttribute("content", urlConsultationGroupes);
		loadJSP(urlGestionTemplate, request, response);
	}

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

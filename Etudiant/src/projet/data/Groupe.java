package projet.data;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Groupe
 *
 */
@Entity
public class Groupe implements Serializable {
   
	@Id
	@GeneratedValue
	private Integer id;
	
	@Column(unique=true, nullable=false)
	private String nom;
	
	@OneToMany(mappedBy= "groupe", fetch= FetchType.LAZY)	// LAZY = fetch when needed, EAGER = fetch immediately
	private List<Etudiant> etudiants;

/*	@ManyToMany(mappedBy = "groupes", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	private List<Module> modules = new ArrayList<>();
	*/
	private static final long serialVersionUID = 1L;

	public Groupe() {
		super();
	}
	public Groupe(Integer id, String nom,  List<Etudiant> etudiants) {
		super();

		this.id = id;
		this.nom = nom;
		this.etudiants = etudiants;
	}   
	public Integer getId() {
		System.out.println("****************** getId");
		System.out.println("****************** this.Id" + this.id);
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}   
	
	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom.toUpperCase();
	}
	

	public List<Etudiant> getEtudiants() {
		System.out.println("****************** getEtudiants");
		System.out.println("****************** this.etudiants" + this.etudiants);

		return this.etudiants;
	}



	/*public List<Module> getModules() {
		return modules;
	}

	public void addModule(Module module) {
		if (!modules.contains(module)) {
			modules.add(module);
			module.addGroupe(this);
		}
	}*/

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (!(o instanceof Groupe)) return false;
		return id != null && id.equals(((Groupe) o).id);
	}

	@Override
	public int hashCode() {
		return id;
	}
}

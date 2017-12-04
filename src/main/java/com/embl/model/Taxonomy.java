package com.embl.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;


@Entity
@Table(name = "taxonomies")
public class Taxonomy {
    @Id
    @Column(name="taxonomy_id")
	private int taxonomyId;
    @Column(name="taxonomy_common_name")
	private String taxonomyCommonName;
    @Column(name="taxonomy_scientific_name")
	private String taxonomyScientificName;
    
	@OneToMany(mappedBy="taxonomyId",  cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private Set<Project> project;
		
	public void setTaxonomyId(int taxonomy_id) {
		this.taxonomyId = taxonomy_id;
	}
	
	public int getTaxonomyId() {
		return taxonomyId;
	}
	
	public void setTaxonomyCommonName(String taxonomy_common_name) {
		this.taxonomyCommonName = taxonomy_common_name;
	}
	
	public String getTaxonomyCommonName() {
		return taxonomyCommonName;
	}
	
	public void setTaxonomyScientificName(String taxonomy_scientific_name) {
		this.taxonomyScientificName = taxonomy_scientific_name;
	}
	
	public String getTaxonomyScientificName() {
		return taxonomyScientificName;
	}	
	
	public Set<Project> setProjects() {
		return project;
	}
	
	public void setProjects(Set<Project> projects) {
		this.project = projects;
	}
	
}

package com.embl.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "projects")
public class Project {
    @Id
    @Column(name="project_id")
	private String projectId;
    @Column(name="title")
	private String title;
    @Column(name="description")
	private String description;
	@Column(name="source_type")
	private String sourceType;
	@Column(name="study_type")
	private String studyType;
	@Column(name="eva_center_name")
	private String evaCenterName;
	@Column(name="center_name")
	private String centerName;
	@Column(name="taxonomy_id", insertable = false, updatable = false)
	private int taxonomyId;
	@ManyToOne
    @JoinColumn(name = "taxonomy_id")
	private Taxonomy taxonomy;
	
	public void setProjectId(String project_id) {
		this.projectId = project_id;
	}
	
	public String getProjectId() {
		return projectId;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setSourceType(String source_type) {
		this.sourceType = source_type;
	}
	
	public String getSourceType() {
		return sourceType;
	}
	
	public void setStudyType(String study_type) {
		this.studyType = study_type;
	}
	
	public String getStudyType() {
		return studyType;
	}
	
	public void setEvaCenterName(String eva_center_name) {
		this.evaCenterName = eva_center_name;
	}
	
	public String getEvaCenterName() {
		return evaCenterName;
	}
	
	public void setCenterName(String center_name) {
		this.centerName = center_name;
	}
	
	public String getCenterName() {
		return centerName;
	}
	
	public void setTaxonomyId(int taxonomy_id) {
		this.taxonomyId = taxonomy_id;
	}
	
	public int getTaxonomyId() {
		return taxonomyId;
	}
	
	public Taxonomy getTaxonomy() {
		return taxonomy;
	}
	
	public void setTaxonomy(Taxonomy taxonomy) {
		this.taxonomy = taxonomy;
	}

}

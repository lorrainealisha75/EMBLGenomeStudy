package com.embl.service;

import java.util.List;

import com.embl.model.Project;

public interface IProjectService {

	Project findByName(String name);
	
	boolean doesProjectExist(Project project);

	void saveProject(Project project);

	void updateProject(Project project);

	void deleteProjectByProjectId(String id);

	void deleteAllProjects();

	List<Project> findAllProjects();
	
	List<Project> findByStudyType(String studyType);
	
	List<Project> findByTaxonomyId(int id);
}

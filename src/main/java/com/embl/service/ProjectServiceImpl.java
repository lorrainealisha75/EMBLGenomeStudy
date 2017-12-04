package com.embl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.embl.model.Project;
import com.embl.repositories.IProjectRepository;

@Service("projectService")
@Transactional
public class ProjectServiceImpl implements IProjectService{

	@Autowired
	private IProjectRepository projectRepository;

	public Project findByName(String projectId) {
		return projectRepository.findByProjectId(projectId);
	}

	public void saveProject(Project project) {
		projectRepository.save(project);
		
	}

	public void updateProject(Project project) {
		saveProject(project);
		
	}

	public void deleteProjectByProjectId(String id) {
		projectRepository.deleteProjectByProjectId(id);
		
	}

	public void deleteAllProjects() {
		projectRepository.deleteAll();
		
	}

	public List<Project> findAllProjects() {
		return projectRepository.findAll();
	}

	public List<Project> findByStudyType(String studyType) {
		return projectRepository.findByStudyType(studyType);
	}

	public List<Project> findByTaxonomyId(int id) {
		return projectRepository.findByTaxonomyId(id);
	}
	
	public boolean doesProjectExist(Project project) {
		return findByName(project.getProjectId()) != null;
	}

}

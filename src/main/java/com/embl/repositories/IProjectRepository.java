package com.embl.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.embl.model.Project;

@Repository
public interface IProjectRepository extends JpaRepository<Project, Long> {
	 
    Project findByProjectId(String id);
    
    void deleteProjectByProjectId(String id);
    
    List<Project> findByStudyType(String studyType);
    
    List<Project> findByTaxonomyId(int id);
 
}

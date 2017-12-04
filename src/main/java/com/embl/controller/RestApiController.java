package com.embl.controller;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.embl.model.Project;
import com.embl.model.Taxonomy;
import com.embl.service.IProjectService;
import com.embl.service.ITaxonomyService;
import com.embl.util.CustomErrorType;


@RestController
@RequestMapping("/embl")
public class RestApiController {

	@Autowired
	IProjectService projService;
	@Autowired
	ITaxonomyService taxonomyService;
	
	//create study
	@RequestMapping(value = "/studies/", method = RequestMethod.POST)
	public ResponseEntity<?> createStudy(@RequestBody Project project, UriComponentsBuilder ucBuilder) {
		if (projService.doesProjectExist(project)) {
			return new ResponseEntity(new CustomErrorType("Unable to create. A study with name " + 
			project.getProjectId() + " already exist."),HttpStatus.CONFLICT);
		}
		Taxonomy taxonomy = project.getTaxonomy();
		taxonomy.setProjects(new HashSet<Project>(){{
            add(project);
        }});
		taxonomyService.saveTaxonomy(taxonomy);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/embl/studies/{id}").buildAndExpand(project.getProjectId()).toUri());
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}

    // Read all studies
    @RequestMapping(value = "/studies/", method = RequestMethod.GET)
    public ResponseEntity<List<Project>> getAllProjects() {
        	List<Project> projects = projService.findAllProjects();
    		if (projects.isEmpty()) {
    			System.out.println("Empty");
    			return new ResponseEntity(HttpStatus.NO_CONTENT);
    		}
    		System.out.println("Not Empty");
    		return new ResponseEntity<List<Project>>(projects, HttpStatus.OK);
    }
    
    //Retrieve single study
	@RequestMapping(value = "/studies/{id}", method = RequestMethod.GET)
	public ResponseEntity<?> getStudy(@PathVariable("id") String id) {
		Project project = projService.findByName(id);
		if (project == null) {
			return new ResponseEntity(new CustomErrorType("User with id " + id 
					+ " not found"), HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Project>(project, HttpStatus.OK);
	}
	
    //Filter by study type or taxonomy id
	@RequestMapping(value = "/filter/{id}", method = RequestMethod.GET)
	public ResponseEntity<?> filterByStudyName(@PathVariable("id") String name) {
		List<Project> projects;
		int id = 0;
		try {
			id = Integer.parseInt(name);
			projects = projService.findByTaxonomyId(id);
			}
		catch(Exception e) {
			projects = projService.findByStudyType(name);
		    }
		if (projects == null) {
			return new ResponseEntity(new CustomErrorType("Study type with name " + name
					+ " not found"), HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<List<Project>>(projects, HttpStatus.OK);
	}
	
	//Delete study
	@RequestMapping(value = "/studies/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteUser(@PathVariable("id") String id) {
		Project project = projService.findByName(id);
		if (project == null) {
			return new ResponseEntity(new CustomErrorType("Unable to delete study with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}
		projService.deleteProjectByProjectId(id);
		return new ResponseEntity<Project>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/studies/{id}", method = RequestMethod.PUT)
	public ResponseEntity<?> updateStudy(@PathVariable("id") String id, @RequestBody Project project) {
		Project currentProject = projService.findByName(id);

		if (currentProject == null) {
			return new ResponseEntity(new CustomErrorType("Unable to update study with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}

		currentProject.setCenterName(project.getCenterName());
		currentProject.setDescription(project.getDescription());
		currentProject.setEvaCenterName(project.getEvaCenterName());
		currentProject.setSourceType(project.getSourceType());
		currentProject.setStudyType(project.getStudyType());
		currentProject.setTitle(project.getTitle());

		projService.updateProject(currentProject);
		return new ResponseEntity<Project>(currentProject, HttpStatus.OK);
	}
}

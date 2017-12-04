package com.embl.EMBLGenomeStudyTest;

import java.net.URI;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.embl.model.Project;
import com.embl.model.Taxonomy;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EMBLGenomeStudy {

	@Test
	public void T1_getAllProjects() {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
        RestTemplate restTemplate = new RestTemplate();
	    String url = "http://localhost:8080/EMBLGenomeStudy/embl/studies/";
        HttpEntity<String> requestEntity = new HttpEntity<String>(headers);
        ResponseEntity<Project[]> responseEntity = restTemplate.exchange(url, HttpMethod.GET, requestEntity, Project[].class);
        Project[] projects = responseEntity.getBody();
        for(Project project : projects) {
              System.out.println("Id:"+project.getProjectId()+", Title:"+project.getTitle());
        }
    }
	
	@Test
    public void T2_createStudy() {    	
    	HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
	    RestTemplate restTemplate = new RestTemplate();
	    String url = "http://localhost:8080/EMBLGenomeStudy/embl/studies/";
	    Project project = new Project();
	    project.setProjectId("PRJEB1234");
	    project.setTitle("Cancer studies");
	    project.setCenterName("Marx Plank Institute");
	    project.setDescription("None");
	    project.setSourceType("Aggregate");
	    project.setStudyType("Germline");
	    Taxonomy taxonomy = new Taxonomy();
	    taxonomy.setTaxonomyId(1234);
	    taxonomy.setTaxonomyCommonName("Dolphin");
	    taxonomy.setTaxonomyScientificName("Delphinidae Odontoceti");
	    project.setTaxonomy(taxonomy);
	    HttpEntity<Project> requestEntity = new HttpEntity<Project>(project, headers);
        URI uri = restTemplate.postForLocation(url, requestEntity);
        System.out.println(uri.getPath());    	      
    }
	
	@Test
    public void T3_getStudy() {
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_JSON);
        RestTemplate restTemplate = new RestTemplate();
	    String url = "http://localhost:8080/EMBLGenomeStudy/embl/studies/{id}";
	    HttpEntity<String> requestEntity = new HttpEntity<String>(headers);
        ResponseEntity<Project> responseEntity = restTemplate.exchange(url, HttpMethod.GET, requestEntity, Project.class, "PRJEB1234");
        Project projectFound = responseEntity.getBody();
        System.out.println("Id:"+projectFound.getProjectId()+", Title:"+projectFound.getTitle());    	
    }
	
    
	@Test
    public void T4_updateStudy() {
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_JSON);
        RestTemplate restTemplate = new RestTemplate();
	    String url = "http://localhost:8080/EMBLGenomeStudy/embl/studies{id}";
	    Project project = new Project();
	    project.setProjectId("PRJEB1236");
	    project.setTitle("Cancer studies");
	    project.setCenterName("Marx Plank Institute");
	    project.setDescription("None");
	    project.setSourceType("Case Set");
	    project.setStudyType("Germline");
        HttpEntity<Project> requestEntity = new HttpEntity<Project>(project, headers);
        restTemplate.exchange(url, HttpMethod.PUT, requestEntity, Void.class, "/PRJEB1234");
        //restTemplate.put(url, requestEntity);
    }
    
	@Test
    public void T5_deleteStudy() {
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_JSON);
        RestTemplate restTemplate = new RestTemplate();
	    String url = "http://localhost:8080/EMBLGenomeStudy/embl/studies/{id}";
        HttpEntity<Project> requestEntity = new HttpEntity<Project>(headers);
        restTemplate.exchange(url, HttpMethod.DELETE, requestEntity, Void.class, "PRJEB1234");        
    }
}
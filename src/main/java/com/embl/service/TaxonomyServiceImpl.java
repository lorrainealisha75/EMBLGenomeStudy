package com.embl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.embl.model.Taxonomy;
import com.embl.repositories.ITaxonomyRepository;

@Service("taxonomyService")
@Transactional
public class TaxonomyServiceImpl implements ITaxonomyService{

	@Autowired
	private ITaxonomyRepository taxonomyRepository;

	public Taxonomy findById(Long id) {
		return taxonomyRepository.findOne(id);
	}

	public Taxonomy findByName(String name) {
		return taxonomyRepository.findByTaxonomyCommonName(name);
	}

	public void saveTaxonomy(Taxonomy taxonomy) {
		taxonomyRepository.save(taxonomy);	
	}

	public void updateTaxonomy(Taxonomy taxonomy) {
		saveTaxonomy(taxonomy);		
	}

	public void deleteTaxonomyById(Long id) {
		taxonomyRepository.delete(id);
	}

	public void deleteAllTaxonomys() {
		taxonomyRepository.deleteAll();
	}

	public List<Taxonomy> findAllTaxonomys() {
		return taxonomyRepository.findAll();
	}

}

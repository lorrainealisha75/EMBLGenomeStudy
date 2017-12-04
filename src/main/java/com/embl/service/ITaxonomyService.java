package com.embl.service;

import java.util.List;

import com.embl.model.Taxonomy;

public interface ITaxonomyService {

	Taxonomy findById(Long id);

	Taxonomy findByName(String name);

	void saveTaxonomy(Taxonomy taxonomy);

	void updateTaxonomy(Taxonomy taxonomy);

	void deleteTaxonomyById(Long id);

	void deleteAllTaxonomys();

	List<Taxonomy> findAllTaxonomys();
	
}

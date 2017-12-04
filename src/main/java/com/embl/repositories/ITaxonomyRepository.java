package com.embl.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.embl.model.Taxonomy;

@Repository
public interface ITaxonomyRepository extends JpaRepository<Taxonomy, Long> {
 
	Taxonomy findByTaxonomyCommonName(String name);
 
}
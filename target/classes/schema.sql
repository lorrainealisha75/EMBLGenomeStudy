DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS taxonomies;
DROP TABLE IF EXISTS hibernate_sequence;

CREATE TABLE taxonomies (
  taxonomy_id INT(10),
  taxonomy_common_name VARCHAR(1000) NOT NULL,
  taxonomy_scientific_name VARCHAR(2000) NOT NULL,
  PRIMARY KEY (taxonomy_id));
 

CREATE TABLE projects (
  project_id VARCHAR(100),
  title VARCHAR(200) NOT NULL,
  description VARCHAR(3000) NOT NULL,
  source_type VARCHAR(200) NOT NULL,
  study_type VARCHAR(200) NOT NULL,
  eva_center_name VARCHAR(1000),
  center_name VARCHAR(1000) NOT NULL,
  taxonomy_id INT(10) NOT NULL,
  PRIMARY KEY (project_id),
  CONSTRAINT FK_Taxonomy FOREIGN KEY (taxonomy_id) REFERENCES taxonomies(taxonomy_id));
  

# EMBL Genome Study

### Setup
 ```
 JDK version : 1.8.0
 OS tested  : Windows 10 / Mac OS 10.12.6
 Maven version : 3.3.3
 Eclipse version : Oxygen 4.7.1a
 Spring Boot version : 1.4.3
 MySql Database Version : 5.6
```

``` 
 Clone the repository :
	 git clone https://github.com/lorrainealisha75/EMBLGenomeStudy.git
	 cd EMBLGenomeStudy
```
### Pre-requisite

``` 
 Database :
     mysql is running on localhost:3306
     login credentials : root/root   (If different then change in application.yml file)
	 create a database in mysql using "create database embl;"
```

### Run the application
 
 ``` 
 mvn spring-boot:run
 
 ``` 

 ```
 
 Once server has started , access the application using 

 http://localhost:8080/EMBLGenomeStudy

 ```

### Run the test-cases

``` 
 Once server has started, run the test cases from another prompt (REST APIs need server to be running) using 
 
 mvn test
 
```

### Run from eclipse
```
 1. Import the project as 'maven project'
 2. Maven Update (ALT+F5)
 3. Maven Clean, build
 4. Launch the URL : http://localhost:8080/EMBLGenomeStudy
```
### Features Covered 

 1. List all the studies
 2. Sort the columns
 3. Create a new study
 4. Filter studies by Taxonomy ID and Study ID
 5. Generic Search (filter) on complete data set
 6. Details of a single study
 7. Update/Delete the study from detailed view 
 8. Implemented all CRUD operation following REST principles
 

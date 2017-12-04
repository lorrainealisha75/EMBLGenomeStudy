<!DOCTYPE html>

<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
</head>
<body>
	<div class="container">
	    <div class="jumbotron alert-danger">
			<h1>Oops. Something went wrong</h1>
			<h2>${status} ${error}</h2>
	    </div>
	</div>
</body>

</html>




<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of Projects</span>
        <button type="button" ng-click="ctrl.callme()" class="btn btn-success custom-width">Here</button></div>
		<div class="panel-body">
		     <form class="form-inline" role="form">
			   <div class="row">
			    <div class="form-group col-md-4 floatLeft" ng-init="col.name='None'"'>
			      <label> Filter  </label>	<br/>		    			  	
			
			      <label>
				    <input type="radio" ng-model="col.name" value="Taxonomy Id">
			        &nbsp;&nbsp; Taxonomy Id 
				  </label> &nbsp;&nbsp;
			
				   <label>
				    <input type="radio" ng-model="col.name" value="Study Type">
				    &nbsp;&nbsp; Study Type  
				  </label>&nbsp;&nbsp;
			  
			  	   <label>
				    <input type="radio" ng-model="col.name" value="None"> 
				    &nbsp;&nbsp; None  
				  </label>&nbsp;&nbsp;
				  
			      <input type="text" class="form-control" ng-model="search" placeholder="Filter by {{col.name}}" ng-show="col.name != 'None'">
			    </div>
			    
			    <div class="col-md-3">&nbsp;</div>
			    <div class="col-md-5 floatRight">
			          <label> Search </label> &nbsp;&nbsp;
			    		  <input type="text" class="form-control" ng-model="search" placeholder="Search" ng-disabled="col.name != 'None'">
			    </div>
			   </div>
 			</form>
 		   <br/>
			<div class="table-responsive">
		        <table class="table table-hover">
		            <thead>
		            <tr>
		       			<th><a ng-click="sortType = 'projectId'; sortReverse = !sortReverse">Project ID<span ng-show="sortType == 'projectId'">&nbsp;<i class="fa" ng-class="{'fa-sort-desc': sortReverse, 'fa-sort-asc': !sortReverse}"></i></span></a></th>
		                <th width="800px">Title</th>
		                <th>Study Type</th>
		             	<th><a ng-click="sortType = 'taxonomyId'; sortReverse = !sortReverse">Taxonomy ID<span ng-show="sortType == 'taxonomyId'"><i class="fa" ng-class="{'fa-sort-desc': sortReverse, 'fa-sort-asc': !sortReverse}"></i></span></a></th>
		                <th><a ng-click="sortType = 'taxonomy.taxonomyCommonName'; sortReverse = !sortReverse">Taxonomy Com.Name<span ng-show="sortType == 'taxonomy.taxonomyCommonName'"><i class="fa" ng-class="{'fa-sort-desc': sortReverse, 'fa-sort-asc': !sortReverse}"></i></span></a></th>
		                <th><a ng-click="sortType = 'taxonomy.taxonomyScientificName'; sortReverse = !sortReverse">Taxonomy Sci.Name<span ng-show="sortType == 'taxonomy.taxonomyScientificName'"><i class="fa" ng-class="{'fa-sort-desc': sortReverse, 'fa-sort-asc': !sortReverse}"></i></span></a></th>
		            </tr>
		            </thead>
		            <tbody> 
		            <tr ng-repeat="u in ctrl.getAllProjects() | orderBy:sortType:sortReverse | filter:search " ng-if="defaultValues">
		                <td>{{u.projectId}}</td>
		                <td>{{u.title}}</td>
		                <td>{{u.studyType}}</td>
		                <td>{{u.taxonomyId}}</td>
		                <td>{{u.taxonomy.taxonomyCommonName}}</td>
		                <td>{{u.taxonomy.taxonomyScientificName}}</td>
		            </tr>  
		            </tbody>
		        </table>		
			</div>
	     
		</div>
    </div>
</div>
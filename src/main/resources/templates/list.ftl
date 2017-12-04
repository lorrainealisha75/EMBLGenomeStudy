<div class="generic-container">
    <div class="panel panel-default">
    		<div class="panel-heading" style="text-align: center;"><span class="lead" style="font-size:28px;">Genome Sequencing Study</label></div>
    	</div>
    <div class="panel panel-default">
       <div class="panel-heading"> <!--<span class="lead">Filter:   </span></div> -->
        <div class="panel-body">
       		  <form class="form-inline" role="form">
			   <div class="row">
			    <div class="form-group col-md-6 floatLeft" ng-init="col.name='None'"'>
			     
			     <label> &nbsp;&nbsp; Filter By : &nbsp;</label>
			     &nbsp;&nbsp;&nbsp;
				    <input type="radio" ng-model="col.name" value="Taxonomy Id"">
			        &nbsp;&nbsp; Taxonomy Id/Study Type
				&nbsp;&nbsp;
	              
				    <input type="radio" ng-model="col.name" value="None" ng-click="ctrl.clearFilters()"> 
				    &nbsp;&nbsp; None  
				  </label>&nbsp;&nbsp;
				  <input type="text" class="form-control" ng-model="filter" placeholder="Taxo. Id/Study Type" ng-show="col.name != 'None'">
				  <a class="btn btn-primary" ng-click="ctrl.filter(filter)" ng-disabled="myForm.$pristine"><span class="glyphicon glyphicon-filter"></span></a>
			
			     </div>
			     
			     <div class="input-group col-md-3" style="margin-left:194px !important">
					 <span class="input-group-addon">
       					 <i class="glyphicon glyphicon-search"></i>
   					 </span>
			    		  <input type="text" class="form-control" ng-model="search" placeholder="Search Keyword" ng-disabled="col.name != 'None'">
			    	 </div>
			    	 
			    	 <div class="col-md-2" style="float:Right; margin-right:-89px;">
			    	     <a class="btn btn-primary btn-default" ng-click="ctrl.getCreateForm()" ng-disabled="myForm.$pristine"><span class="glyphicon glyphicon-plus"></span> Add Study</a>
			     </div>
			    </div>
 			  </form>
    			<div class="panel-body">
				<div class="table-responsive">
		        		<table class="table table-hover">
		            		<thead>
			            <tr>
			                <th><a ng-click="sortType = 'projectId'; sortReverse = !sortReverse">Project ID<span ng-show="sortType == 'projectId'">&nbsp;&nbsp;<i class="fa" ng-class="{'fa-sort-desc': sortReverse, 'fa-sort-asc': !sortReverse}"></i></span></a></th>
			                <th width="800px">Title</th>
			                <th>Study Type</th>
			             	<th><a ng-click="sortType = 'taxonomyId'; sortReverse = !sortReverse">Taxonomy ID<span ng-show="sortType == 'taxonomyId'">&nbsp;&nbsp;<i class="fa" ng-class="{'fa-sort-desc': sortReverse, 'fa-sort-asc': !sortReverse}"></i></span></a></th>
			                <th><a ng-click="sortType = 'taxonomy.taxonomyCommonName'; sortReverse = !sortReverse">Taxonomy Com.Name<span ng-show="sortType == 'taxonomy.taxonomyCommonName'">&nbsp;&nbsp;<i class="fa" ng-class="{'fa-sort-desc': sortReverse, 'fa-sort-asc': !sortReverse}"></i></span></a></th>
			                <th><a ng-click="sortType = 'taxonomy.taxonomyScientificName'; sortReverse = !sortReverse">Taxonomy Sci.Name<span ng-show="sortType == 'taxonomy.taxonomyScientificName'">&nbsp;&nbsp;<i class="fa" ng-class="{'fa-sort-desc': sortReverse, 'fa-sort-asc': !sortReverse}"></i></span></a></th>
			           </tr>
			            </thead>
			            <tbody>
			            <tr ng-repeat="u in ctrl.getAllProjects() | orderBy:sortType:sortReverse | filter:search " ng-if="defaultValues">
			                <td><a ng-click="ctrl.invokeDetailedView(u.projectId)">{{u.projectId}}</a></td>
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
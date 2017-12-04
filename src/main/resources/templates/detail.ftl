<div class="generic-container-2">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading" style="text-align: center;">
       		<span class="lead"><label>{{ctrl.getProjectDetails().title}} <label></span>
        	</div>
        	<br/>
		<div class="panel-body" style="font-size:16px;">
	                <div class="row">
	                    <div class="col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="pid">Project ID </label>
	                        <div class="col-md-2">
	                        		    {{ctrl.getProjectDetails().projectId}}
	                        </div>
	                       
	                    </div>
	                </div>
					<br/>
					
					<div class="row">
	                    <div class="col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="source">Source Type </label>
	                        <div class="col-md-2">
	                        		    {{ctrl.getProjectDetails().sourceType}}
	                        </div>
	                      </div>
	                </div>
	                <br/>
	                
	                <div class="row">
	                    <div class="col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                         <label class="col-md-3 control-lable" for="study">Study Type </label>
	                        <div class="col-md-6">
	                        		    {{ctrl.getProjectDetails().studyType}}
	                        </div>
	                    </div>
	                </div>
	                <br/>
	                
	                <div class="row">
	                    <div class="col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                         <label class="col-md-3 control-lable" for="tid">Taxonomy ID </label>
	                        <div class="col-md-2">
	                        		    {{ctrl.getProjectDetails().taxonomyId}}
	                        </div>
	                    </div>
	                </div>
	                <br/>
	                
	                <div class="row">
	                    <div class="col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="tcn">Taxonomy Common Name </label>
	                        <div class="col-md-4">
	                        		    {{ctrl.getProjectDetails().taxonomy.taxonomyCommonName}}
	                        </div>
	                    </div>
	                </div>
	             	<br/>
	                
	                <div class="row">
	                    <div class="col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                         <label class="col-md-3 control-lable" for="tsn">Taxonomy Scientific Name </label>
	                        <div class="col-md-8">
	                        		    {{ctrl.getProjectDetails().taxonomy.taxonomyScientificName}}
	                        </div>
	                    </div>
	                </div>
	                <br/>
	                
	                <div class="row">
	                    <div class="col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="desc">Description </label>
	                        <div class="col-md-8">
	                        			{{ctrl.getProjectDetails().description}}
	                        </div>
	                    </div>
	                </div>
	                <br/>
	                
	                <div class="row">
	                    <div class="col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="eva">EVA Center Name</label>
	                        <div class="col-md-8">
	                        		    {{ctrl.getProjectDetails().evaCenterName}}
	                        </div>
	                    </div>
	                </div>
	                <br/>
	                
	                <div class="row">
	                    <div class="col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="center">Center Name</label>
	                        <div class="col-md-8">
	                        		    {{ctrl.getProjectDetails().centerName}}
	                        </div>
	                    </div>
	                </div>
	                <br/>
	                <br/>
	      <a class="btn btn-primary btn-float-left" ng-click="ctrl.back()"><span class="glyphicon glyphicon-menu-left"></span> Back</a>
	      <a class="btn btn-primary btn-float-right" ng-click="ctrl.getUpdateForm(ctrl.getProjectDetails().projectId)"><span class="glyphicon glyphicon-refresh"></span> Update</a>
	      <a class="btn btn-danger btn-float-right btn-right-margin" confirmed-click="ctrl.removeProject(ctrl.getProjectDetails().projectId)" ng-confirm-click="Would you like to really delete this record?"><span class="glyphicon glyphicon-remove"></span> Delete</a>
	      </div>
	 </div>
</div>
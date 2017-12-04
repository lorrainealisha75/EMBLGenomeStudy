<div class="generic-container-2">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading" style="text-align: center;">
        		<span class="lead"><label>Add Study <label></span>
        	</div>
        	<br/>
		<div class="panel-body" style="font-size:16px;">
			<div class="formcontainer">
				<div class="alert alert-success" role="alert" ng-show="ctrl.successMessage2 !=''">{{ctrl.successMessage2}}</div>
	            <div class="alert alert-danger" role="alert" ng-show="ctrl.errorMessage2 !=''">{{ctrl.errorMessage2}}</div>
	            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
	            
	            	<div class="row">
	                    <div class="form-group col-md-12" ng-class="{ 'has-error' : myForm.pid.$invalid && !myForm.id.$pristine }">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="pid">*Project Id </label>
	                        <div class="col-md-7">
	                        	<input type="text" ng-model="ctrl.project.projectId" name="pid" class="pid form-control input-sm" placeholder="Enter project id" required ng-minlength="3"/>
	                        <p ng-show="myForm.pid.$error.minlength" class="help-block">Project ID is too short.</p>
	                         </div>
	                       
	                    </div>
	                </div>
					<br/>
	                
	                <div class="row">
	                    <div class="form-group col-md-12" ng-class="{ 'has-error' : myForm.ptitle.$invalid && !myForm.ptitle.$pristine }">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="pid">*Project Title </label>
	                        <div class="col-md-7">
	                        	<input type="text" ng-model="ctrl.project.title" name="ptitle" class="ptitle form-control input-sm" placeholder="Enter project name" required ng-minlength="3"/>
	                        	<p ng-show="myForm.ptitle.$error.minlength" class="help-block">Project Title is too short.</p>
	                         </div>
	                       
	                    </div>
	                </div>
					<br/>
					
					<div class="row">
	                    <div class="form-group col-md-12" ng-class="{ 'has-error' : myForm.srctype.$invalid && !myForm.srctype.$pristine }">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="source">*Source Type </label>
	                        <div class="col-md-7">
	                        		    <input type="text" ng-model="ctrl.project.sourceType" name="srctype" class="srctype form-control input-sm" placeholder="Enter Source Type" required ng-minlength="3"/>
	                        <p ng-show="myForm.srctype.$error.minlength" class="help-block">Source Type is too short.</p>
	                        </div>
	                      </div>
	                </div>
	                <br/>
	                
	                <div class="row">
	                    <div class="form-group col-md-12" ng-class="{ 'has-error' : myForm.stdtype.$invalid && !myForm.stdtype.$pristine }">
	                    		<div class="col-md-1">&nbsp;</div>
	                         <label class="col-md-3 control-lable" for="study">*Study Type </label>
	                        <div class="col-md-7">
	                        		    <input type="text" ng-model="ctrl.project.studyType" name="stdtype" class="stdtype form-control input-sm" placeholder="Enter Study Type" required ng-minlength="3"/>
	                        <p ng-show="myForm.stdtype.$error.minlength" class="help-block">Study Type is too short.</p>
	                        </div>
	                    </div>
	                </div>
	                <br/>
	                
	                <div class="row">
	                    <div class="form-group col-md-12" ng-class="{ 'has-error' : myForm.desc.$invalid && !myForm.desc.$pristine }">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="desc">*Description </label>
	                        <div class="col-md-7">
	                          	<textarea rows="5" ng-model="ctrl.project.description" name="desc" class="desc form-control input-sm" placeholder="Enter Description" required ng-minlength="3"></textarea>
	                        <p ng-show="myForm.desc.$error.minlength" class="help-block">Description is too short.</p>
	                        </div>
	                    </div>
	                </div>
	                <br/>
	                
	                <div class="row">
	                    <div class="form-group col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="eva">EVA Center Name</label>
	                        <div class="col-md-7">
	                        		    <input type="text" ng-model="ctrl.project.evaCenterName" id="eva" class="eva form-control input-sm" placeholder="Enter EVA Center Name"/>
	                        </div>
	                    </div>
	                </div>
	                <br/>
	                
	                <div class="row">
	                    <div class="form-group col-md-12" ng-class="{ 'has-error' : myForm.center.$invalid && !myForm.center.$pristine }">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="center">*Center Name</label>
	                        <div class="col-md-7">
	                        		    <input type="text" ng-model="ctrl.project.centerName" name="center" class="center form-control input-sm" placeholder="Enter Center Name" required ng-minlength="3"/>
	                        <p ng-show="myForm.center.$error.minlength" class="help-block">Center Name is too short.</p>
	                        </div>
	                    </div>
	                </div>
	                <br>
	                
	                <div class="row">
	                    <div class="form-group col-md-12" ng-class="{ 'has-error' : myForm.tid.$invalid && !myForm.tid.$pristine }">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="center">*Taxonomy ID</label>
	                        <div class="col-md-7">
	                        		    <input type="text" ng-model="ctrl.project.taxonomy.taxonomyId" name="tid" class="center form-control input-sm" placeholder="Enter Center Name" required ng-minlength="3" ng-maxlength=8
	                        		    ng-pattern="/^[0-9]+$/"/>
	                        <p ng-show="myForm.tid.$error.minlength" class="help-block">Taxonomy Id is too short.</p>
	                        <p ng-show="myForm.tid.$error.maxlength" class="help-block">Taxonomy Id can be of max 8 characters.</p>
	                        <p ng-show="myForm.tid.$error.pattern" class="help-block">Only numbers are allowed.</p>
	                        </div>
	                    </div>
	                </div>
	                <br>
	                
	                <div class="row">
	                    <div class="form-group col-md-12" ng-class="{ 'has-error' : myForm.tcname.$invalid && !myForm.tcname.$pristine }">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="center">*Taxonomy Common Name</label>
	                        <div class="col-md-7">
	                        		    <input type="text" ng-model="ctrl.project.taxonomy.taxonomyCommonName" name="tcname" class="center form-control input-sm" placeholder="Enter Center Name" required ng-minlength="3"/>
	                        <p ng-show="myForm.tcname.$error.minlength" class="help-block">Taxonomy Common Name is too short.</p>
	                        </div>
	                    </div>
	                </div>
	                <br>
	                
	                <div class="row">
	                    <div class="form-group col-md-12" ng-class="{ 'has-error' : myForm.tsname.$invalid && !myForm.tsname.$pristine }">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="center">*Taxonomy Scientific Name</label>
	                        <div class="col-md-7">
	                        		    <input type="text" ng-model="ctrl.project.taxonomy.taxonomyScientificName" name="tsname" class="center form-control input-sm" placeholder="Enter Center Name" required ng-minlength="3"/>
	                        <p ng-show="myForm.tsname.$error.minlength" class="help-block">Taxonomy Scientific Name is too short.</p>
	                        </div>
	                    </div>
	                </div>
	                <br>
	                
	                <div class="row">
	                  <div class="cform-group ol-md-12">
	                    <div class="col-md-1">&nbsp;</div>
	                    <div class="col-md-3 floatLeft" style="font-size: 10px">
	                	    	*=Mandatory Fields
	                	    </div>
	                   </div>
	                </div>
	     
	      <a class="btn btn-primary btn-float-left" ng-click="ctrl.back()"><span class="glyphicon glyphicon-menu-left"></span> Back</a>
	      
	      <button type="submit" class="btn btn-primary btn-float-right" ng-disabled="myForm.$invalid || myForm.$pristine"><span class="glyphicon glyphicon-plus"></span> Add</button>
	      <a class="btn btn-danger btn-float-right btn-right-margin" ng-click="ctrl.reset()" ng-disabled="myForm.$pristine"><span class="glyphicon glyphicon-repeat"></span> Reset</a>
	     
	                
	                
	            </form> 
	               
	            </div>
	             <br/>
	      </div>
	</div>
</div>
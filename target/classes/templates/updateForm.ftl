<div class="generic-container-2">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading" style="text-align: center;">
        <!--		<button type="button" ng-click="ctrl.backToDetail()" class="btn btn-success custom-width btn-float-left">Back</button> -->
        		<span class="lead"><label>Update Study : <label></span>
        		<span class="lead"><label>{{ctrl.getProjectDetails().projectId}}<label></span>
        	</div>
        	<br/>
		<div class="panel-body" style="font-size:16px;">
			<div class="formcontainer">
				<div class="alert alert-success" role="alert" ng-show="ctrl.successMessage != ''">{{ctrl.successMessage}}</div>
	            <div class="alert alert-danger" role="alert" ng-show="ctrl.errorMessage !=''">{{ctrl.errorMessage}}</div>
	            <form ng-submit="ctrl.submit(ctrl.getProjectDetails().projectId)" name="myForm" class="form-horizontal">
	          
	            
	            
	            	<div class="row">
	                    <div class="form-group col-md-12">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="pid">*Project Id </label>
	                        <div class="col-md-2">
	                        	 <input type="text" id="pid" class="projectname form-control input-sm" ng-readonly="true" value={{ctrl.getProjectDetails().projectId}} aria-label="Readonly field"/>
	                        </div>
	                    </div>
	                </div>
					<br/>
	            
	            
	                <div class="row">
	                    <div class="form-group col-md-12" ng-class="{ 'has-error' : myForm.ptitle.$invalid && !myForm.ptitle.$pristine }">
	                    		<div class="col-md-1">&nbsp;</div>
	                        <label class="col-md-3 control-lable" for="ptitle">*Project Title 
	                        	</label>
	                        <div class="col-md-7">
	                        	 <input type="text" ng-model="ctrl.project.title" name="ptitle" class="projectname form-control input-sm" placeholder="Enter Project Title" required ng-minlength="3"/>
	                         <p ng-show="myForm.ptitle.$error.minlength" class="help-block">Title is too short.</p>
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
	                  <div class="col-md-12">
	                    <div class="col-md-1">&nbsp;</div>
	                    <div class="col-md-3 floatLeft" style="font-size: 10px">
	                	    	*=Mandatory Fields
	                	    </div>
	                   </div>
	                </div>
	                
	      <a class="btn btn-primary btn-float-left" ng-click="ctrl.back()"><span class="glyphicon glyphicon-menu-left"></span> Back</a>
	      
	      <button type="submit" class="btn btn-primary btn-float-right" ng-disabled="myForm.$invalid || myForm.$pristine"><span class="glyphicon glyphicon-refresh"></span> Update</button>
	      <a class="btn btn-danger btn-float-right btn-right-margin" ng-click="ctrl.reset()" ng-disabled="myForm.$pristine"><span class="glyphicon glyphicon-repeat"></span> Reset</a>
	     
	                
	            </form> 
	               
	            </div>
	             <br/>
	      </div>
	</div>
</div>
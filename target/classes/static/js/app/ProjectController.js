'use strict';

angular.module('crudApp').controller('ProjectController',
    ['ProjectService', '$localStorage', '$scope', '$state', '$stateParams',  function(ProjectService, $localStorage, $scope, $state, $stateParams) {

        var self = this;
        
        self.projects = [];
        
        $scope.col = {
        		name: 'None'
        };
        
        $scope.defaultValues = 'true';
       
        self.getAllProjects = getAllProjects;
        self.invokeDetailedView = invokeDetailedView;
        self.getProjectDetails = getProjectDetails;
        self.removeProject = removeProject;
        self.getUpdateForm = getUpdateForm;
        self.createProject = createProject;
        self.submit = submit;
        self.updateProject = updateProject;
        self.getCreateForm = getCreateForm;
        self.filter = filter;
        self.clearFilters = clearFilters;
        self.back = back;
        self.backToDetail = backToDetail;
        
     
        self.successMessage = '';
        self.errorMessage = '';
        self.successMessage2 = '';
        self.errorMessage2 = '';
        self.done = false;

        self.onlyIntegers = /^\d+$/;
        self.onlyNumbers = /^\d+([,.]\d+)?$/;

        function getAllProjects(){
            return ProjectService.getAllProjects();
        }
      
        function invokeDetailedView(projectId){
            self.successMessage='';
            self.errorMessage='';
            ProjectService.invokeDetailedView(projectId).then(
                function (project) {
                	$localStorage.project = project;
                    $state.go('detailedView');
                },
                function (errResponse) {
                    console.error('Error while removing user ' + projectId + ', Error :' + errResponse.data);
                }
            );
        }
        
        function getProjectDetails(){
        	return $localStorage.project;
        }
        
        function removeProject(id){
            console.log('About to remove User with id '+id);
            ProjectService.removeProject(id)
                .then(
                    function(){
                        $state.go('home');
                    },
                    function(errResponse){
                        console.error('Error while removing user '+id +', Error :'+errResponse.data);
                    }
                );
        }
        
        function getUpdateForm(id){
        	$state.go('updateView');
        }
        
        function getCreateForm(id){
        	$state.go('createView');
        }
        
        function submit(id) {
        	if(id==undefined || id==null){
        		createProject(self.project);
        	} else {
        		updateProject(self.project, id);
        	}
        }

        function createProject(project) {
            ProjectService.createProject(project)
                .then(
                    function (response) {
                        console.log('Project created successfully');
                        self.successMessage = 'Project created successfully';
                        self.errorMessage='';
                        self.done = true;
                        self.project={};
                        //$scope.myForm.$setPristine();
                        $state.go('home');
                        
                    },
                    function (errResponse) {
                        self.errorMessagFe = 'Error while creating project: ' + errResponse.data.errorMessage;
                        self.successMessage='';
                    }
                );
        }
        
        function updateProject(project, id){
            console.log('About to update project');
            ProjectService.updateProject(project, id)
                .then(
                    function (response){
                        console.log('Project updated successfully');
                        self.successMessage='Project updated successfully';
                        //$scope.myForm.$setPristine();
                        $state.go('home');
                    },
                    function(errResponse){
                        console.error('Error while updating Project');
                        self.errorMessage='Error while updating Project '+errResponse.data;
                        self.successMessage='';
                    }
                );
        }
        
        function filter(id){
            ProjectService.filter(id)
            .then(
                function (response){
                    console.log('Project records updated successfully');
                    self.successMessage='Project updated successfully';
                },
                function(errResponse){
                    console.error('Error while fetching Project records');
                    self.errorMessage='Error while fetching Project records '+errResponse.data;
                    self.successMessage='';
                }
            );
        }
        
        function clearFilters(){
            ProjectService.clearFilters()
            .then(
                function (response){
                    console.log('Project records updated successfully');
                    self.successMessage='Project updated successfully';
                },
                function(errResponse){
                    console.error('Error while fetching Project records');
                    self.errorMessage='Error while fetching Project records '+errResponse.data;
                    self.successMessage='';
                }
            );
        }
        
        function back(){
        	$state.go('home');
        }
        
        function backToDetail(){
        	$state.go('detailedView');
        }
    }
  ]);
angular.module('crudApp').directive('ngConfirmClick', [
    function() {
        return {
            link: function (scope, element, attr) {
                var msg = attr.ngConfirmClick || "Are you sure?";
                var clickAction = attr.confirmedClick;
                element.bind('click', function (event) {
                    if (window.confirm(msg)) {
                        scope.$eval(clickAction)
                    }
                });
            }
        };
}])
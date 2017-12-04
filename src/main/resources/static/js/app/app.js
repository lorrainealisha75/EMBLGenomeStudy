var app = angular.module('crudApp',['ui.router','ngStorage']);

app.constant('urls', {
    BASE: 'http://localhost:8080/EMBLGenomeStudy',
    USER_SERVICE_API : 'http://localhost:8080/EMBLGenomeStudy/embl/studies/',
    FILTER_SERVICE_API : 'http://localhost:8080/EMBLGenomeStudy/embl/filter/'
});

app.config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
       
        $stateProvider
            .state('home', {
                url: '/',
                templateUrl: 'partials/list',
                controller:'ProjectController',
                controllerAs:'ctrl',
                resolve: {
                    projects: function ($q, ProjectService) {
                        var deferred = $q.defer();
                        ProjectService.loadAllProjects().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
            });
        $stateProvider
	        .state('detailedView', {
	            url: '/detailedView',
	            templateUrl: 'partials/detail',
	            controller:'ProjectController',
	            controllerAs:'ctrl'
	        });
        $stateProvider
	        .state('updateView', {
	            url: '/updateView',
	            templateUrl: 'partials/updateForm',
	            controller:'ProjectController',
	            controllerAs:'ctrl'
	        });
        $stateProvider
	        .state('createView', {
	            url: '/createView',
	            templateUrl: 'partials/createForm',
	            controller:'ProjectController',
	            controllerAs:'ctrl'
	        });
        
        $urlRouterProvider.otherwise('/');
    }]);


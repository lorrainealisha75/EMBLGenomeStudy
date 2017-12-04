'use strict';

angular.module('crudApp').factory('ProjectService',
    ['$localStorage', '$http', '$q', 'urls',
        function ($localStorage, $http, $q, urls) {

            var factory = {
                loadAllProjects: loadAllProjects,
                getAllProjects: getAllProjects,
                invokeDetailedView: invokeDetailedView,
                removeProject: removeProject,
                createProject: createProject,
                updateProject: updateProject,
                filter: filter,
                clearFilters: clearFilters
            };

            return factory;

            function loadAllProjects() {
                console.log('Fetching all projects');
                var deferred = $q.defer();
                $http.get(urls.USER_SERVICE_API)
                    .then(
                        function (response) {
                            console.log('Fetched successfully all projects');
                            $localStorage.projects = response.data;
                            deferred.resolve(response);
                        },
                        function (errResponse) {
                            console.error('Error while loading projects');
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }
            
            function getAllProjects(){
            		return $localStorage.projects;
            }
            
            function invokeDetailedView(projectId){
            	var deferred = $q.defer();
                $http.get(urls.USER_SERVICE_API + projectId)
                .then(
                    function (response) {
                        console.log('Fetched study successfully');
                        $localStorage.projects = response.data;
                        deferred.resolve(response.data);
                    },
                    function (errResponse) {
                        console.error('Error while retrieving study');
                        deferred.reject(errResponse);
                    }
                );
            return deferred.promise;
            }
            
            function removeProject(id) {
                console.log('Removing study with id '+id);
                var deferred = $q.defer();
                $http.delete(urls.USER_SERVICE_API + id)
                    .then(
                        function (response) {
                            loadAllProjects();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while removing study with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }
            
            function createProject(project) {
                console.log('Creating project');
                var deferred = $q.defer();
                $http.post(urls.USER_SERVICE_API, project)
                    .then(
                        function (response) {
                            loadAllProjects();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                           console.error('Error while creating project : '+errResponse.data.errorMessage);
                           deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function updateProject(project, id) {
                console.log('Updating project with id '+id);
                var deferred = $q.defer();
                $http.put(urls.USER_SERVICE_API + id, project)
                    .then(
                        function (response) {
                            loadAllProjects();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while updating project with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }
            
            function filter(id) {
                var deferred = $q.defer();
                $http.get(urls.FILTER_SERVICE_API + id)
                    .then(
                        function (response) {
                            //loadAllProjects();
                        	$localStorage.projects = response.data;
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while fetching records for taxonomy id '+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }
            
            function clearFilters(){
            	    return loadAllProjects();
            }
            
    }
    ]);
var backboneDependencies, dependencies, initializers, postInitialize;

initializers = [
  'application',
  'vendor/jquery/jquery.min',
  'vendor/underscore/underscore-min',
  'vendor/backbone/backbone-min',
  'vendor/d3/d3.min'
];

backboneDependencies = {
  deps: [ 'vendor/jquery/jquery.min', 'vendor/underscore/underscore-min' ]
};

dependencies = { 'vendor/backbone.min': backboneDependencies };

postInitialize = function postInitialize(application) {
  window.<%= _.capitalize(appName) %> = application;
};

requirejs.config({ shim: dependencies });
require(initializers, postInitialize);

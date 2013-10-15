var backboneDependencies, dependencies, initializers, postInitialize,
  applicationModels;

initializers = [
  'application',
  'models-manifest',
  'collections-manifest',
  'views-manifest',
  'routers-manifest',
  'components-manifest',
  'pages-manifest',
  'vendor/jquery/jquery.min',
  'vendor/underscore/underscore-min',
  'vendor/backbone/backbone-min',
  'vendor/d3/d3.min'
];

backboneDependencies = {
  deps: [ 'vendor/jquery/jquery.min', 'vendor/underscore/underscore-min' ]
};

applicationModels = { deps: [ 'application' ] }

dependencies = { 'vendor/backbone.min': backboneDependencies,
  'model-manifest': applicationModels };

postInitialize = function postInitialize(application) {
  window.<%= _.capitalize(appName) %> = application;
};

requirejs.config({ shim: dependencies });
require(initializers, postInitialize);

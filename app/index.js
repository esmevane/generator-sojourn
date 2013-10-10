'use strict';
var path, SojournGenerator, util, yeoman;

util   = require('util');
path   = require('path');
yeoman = require('yeoman-generator');

SojournGenerator = function SojournGenerator(args, options, config) {
  var fileName, fileContents, nodeConfig, installConfig;

  fileName      = path.join(__dirname, '../package.json');
  fileContents  = this.readFileAsString(fileName);
  nodeConfig    = JSON.parse(fileContents);
  installConfig = { skipInstall: options['skip-install'] } ;

  yeoman.generators.Base.apply(this, arguments);

  this.on('end', function () { this.installDependencies(installConfig) });
  this.pkg = nodeConfig;
};

module.exports = SojournGenerator;

util.inherits(SojournGenerator, yeoman.generators.Base);

SojournGenerator.prototype.askFor = function askFor() {
  var unpause = this.async();

  // have Yeoman greet the user.
  console.log(this.yeoman);

  var prompts = [{
    name: 'appName',
    message: 'What would you like to name your application?'
  }];

  this.prompt(prompts, function (properties) {
    this.appName = properties.appName;

    unpause();
  }.bind(this));
};

SojournGenerator.prototype.nodeConfig = function nodeConfig() {
  this.template('_package.json', 'package.json');
}

SojournGenerator.prototype.bowerConfig = function bowerConfig() {
  this.template('_bower.json', 'bower.json');
}

SojournGenerator.prototype.gruntConfig = function gruntConfig() {
  this.template('Gruntfile.coffee');
}

SojournGenerator.prototype.appStructure = function appStructure() {
  this.mkdir('app');
  this.mkdir('app/scripts');
  this.mkdir('app/styles');
  this.mkdir('app/images');

  this.copy('index.html', 'app/index.html');
};

SojournGenerator.prototype.assetStructure = function() {
  this.mkdir('assets');

  this.mkdir('assets/scripts');
  this.copy('application.coffee', 'assets/scripts/application.coffee');

  this.template('dependencies.js', 'app/scripts/dependencies.js')

  this.mkdir('assets/styles');
  this.copy('application.sass', 'assets/styles/application.sass');
};

SojournGenerator.prototype.specStructure = function specStructure() {
  this.mkdir('spec');
  this.mkdir('spec/support');
  this.mkdir('spec/fixtures');
}

SojournGenerator.prototype.dotConfig = function dotConfig() {
  this.copy('bowerrc', '.bowerrc');
  this.copy('editorconfig', '.editorconfig');
  this.copy('jshintrc', '.jshintrc');
  this.copy('gitignore', '.gitignore');
};

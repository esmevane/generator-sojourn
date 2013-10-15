path        = require 'path'
yeoman      = require 'yeoman-generator'
directories = require '../directories'

class SojournGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    file    = @readFileAsString path.join __dirname, "../package.json"
    config  = JSON.parse file
    install = skipInstall: options['skip-install']
    @pkg    = config

    @on 'end', -> @installDependencies install
    super

  askFor: ->
    unpause = @async()
    askName =
      name:     'appName',
      message:  'What would you like to name your application?'
    prompts = [askName]

    console.log @yeoman

    @prompt prompts, (properties) =>
      @appName = properties.appName
      unpause()

  projectConfig: ->
    @template '_package.json', 'package.json'
    @template '_bower.json', 'bower.json'
    @template '_sojourn.json', 'sojourn.json'
    @template 'Gruntfile.coffee'

  appStructure: ->
    directories.make @, 'app', 'app/scripts', 'app/styles', 'app/images'
    @copy 'index.html', 'app/index.html'

  assetStructure: ->
    generators = ['models', 'collections', 'views', 'routers', 'components',
      'pages']
    directories.make @, 'assets', 'assets/scripts', 'assets/styles'
    @copy 'application.coffee', 'assets/scripts/application.coffee'
    @copy 'application.sass', 'assets/styles/application.sass'
    @template 'dependencies.js', 'app/scripts/dependencies.js'
    for generator in generators
      @write "app/scripts/#{generator}-manifest.js", ''

  specStructure: ->
    directories.make @, 'spec', 'spec/support', 'spec/fixtures'

  dotConfig: ->
    @copy 'bowerrc',      '.bowerrc'
    @copy 'editorconfig', '.editorconfig'
    @copy 'jshintrc',     '.jshintrc'
    @copy 'gitignore',    '.gitignore'

module.exports = SojournGenerator


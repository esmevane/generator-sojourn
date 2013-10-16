pluralize   = require('underscore.inflections').pluralize
yeoman      = require 'yeoman-generator'
Directories = require './directories'
Manifest    = require './sojourn-manifest'
Settings    = require './sojourn-settings'

class SojournGenerator extends yeoman.generators.NamedBase
  constructor: (args, options, config) ->
    super

    @_targets = pluralize @_target
    filename  = "app/scripts/#{@_targets}-manifest.js"
    directory = "app/scripts/#{@_targets}"
    @settings = new Settings
    @manifest = new Manifest filename, directory
    @appName  = @settings.get 'name'

    @initialize()

  initialize: ->

  layout: ->
    Directories.make @, 'app', 'app/scripts', "app/scripts/#{@_targets}",
      'assets', 'assets/scripts', "assets/scripts/#{@_targets}"

  build: ->
    name = @_.slugify @name
    @template "#{@_target}.coffee",
      "assets/scripts/#{@_targets}/#{name}.coffee"
    @write "app/scripts/#{@_targets}/#{name}.js", ''

  register: ->
    @settings.push @_targets, @name
    @settings.save()
    @manifest.save()

module.exports = SojournGenerator
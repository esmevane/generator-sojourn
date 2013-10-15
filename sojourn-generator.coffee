pluralize   = require('underscore.inflections').pluralize
yeoman      = require 'yeoman-generator'
directories = require './directories'
manifest    = require './sojourn-manifest'
settings    = require './sojourn-settings'

class SojournGenerator extends yeoman.generators.NamedBase
  constructor: (args, options, config) ->
    @section   = @_define()
    @sections  = pluralize @section
    super
    filename   = "app/scripts/#{@sections}-manifest.js"
    directory  = "app/scripts/#{@sections}"
    @settings  = new settings
    @manifest  = new manifest @, filename, directory
    @appName   = @settings.get 'name'
    @_postInitialize()

  _setup: ->
  _postInitialize: ->

  makeDirectory: ->
    directories.make @, 'app', 'app/scripts', "app/scripts/#{@sections}",
      'assets', 'assets/scripts', "assets/scripts/#{@sections}"

  build: ->
    name = @_.slugify @name
    @template "#{@section}.coffee",
      "assets/scripts/#{@sections}/#{name}.coffee"
    @write "app/scripts/#{@sections}/#{name}.js", ''

  register: ->
    @settings.push @sections, @name
    @settings.save()
    @manifest.save()

module.exports = SojournGenerator
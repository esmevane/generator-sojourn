singularize = require('underscore.inflections').singularize
Generator   = require '../sojourn-generator'

class CollectionGenerator extends Generator
  _target: 'collection'

  initialize: ->
    @modelName = singularize @name
    @hookFor 'sojourn:model', args: @modelName

  layout:   -> super
  build:    -> super
  register: -> super

module.exports = CollectionGenerator
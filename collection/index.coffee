singularize = require('underscore.inflections').singularize
generator   = require '../sojourn-generator'

class CollectionGenerator extends generator
  _define:       -> 'collection'
  makeDirectory: -> super
  build:         -> super
  register:      -> super

  _postInitialize: ->
    @modelName = singularize @name
    @hookFor 'sojourn:model', args: @modelName

module.exports = CollectionGenerator
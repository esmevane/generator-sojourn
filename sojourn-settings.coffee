_ = require 'lodash'
fs = require 'fs'

class SojournSettings
  constructor: (@path = 'sojourn.json') ->
    @rawJson = JSON.parse fs.readFileSync @path
    @set key, @rawJson[key] for key in @whitelist()

  get: (key) -> @store[key]

  push: (key, value) ->
    @store[key] ?= []
    @store[key].push value
    @store[key] = _.uniq @store[key].sort()

  save: -> fs.writeFileSync @path, JSON.stringify @store

  set: (key, value) ->
    @store ?= {}
    @store[key] = value

  whitelist: -> [ 'name', 'models', 'collections', 'pages'
    'routers', 'views', 'components' ]

module.exports = SojournSettings
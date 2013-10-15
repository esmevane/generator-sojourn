_  = require 'underscore'
fs = require 'fs'

class SojournManifest
  constructor: (@builder, @manifest, @directory) ->

  contents: ->
    relative = @directory.replace 'app/', ''
    files    = fs.readdirSync @directory
    fileList = _.map files, (file) -> "#{relative}/#{file}"
    "require(#{JSON.stringify fileList});"

  save: -> @builder.write @manifest, @contents()

module.exports = SojournManifest
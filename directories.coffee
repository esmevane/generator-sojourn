class Directories
  constructor: (@builder, @directories) ->
  make: -> @builder.mkdir directory for directory in @directories

Directories.make = (builder, directories...) ->
  (new Directories builder, directories).make()

module.exports = Directories
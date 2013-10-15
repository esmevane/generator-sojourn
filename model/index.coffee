generator = require '../sojourn-generator'

class ModelGenerator extends generator
  _define:       -> 'model'
  makeDirectory: -> super
  build:         -> super
  register:      -> super

module.exports = ModelGenerator

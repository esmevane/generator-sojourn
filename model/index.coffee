Generator = require '../sojourn-generator'

class ModelGenerator extends Generator
  _target: 'model'

  layout:   -> super
  build:    -> super
  register: -> super

module.exports = ModelGenerator

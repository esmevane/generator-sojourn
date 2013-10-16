Generator = require '../sojourn-generator'

class ComponentGenerator extends Generator
  _target: 'component'

  layout:   -> super
  build:    -> super
  register: -> super

module.exports = ComponentGenerator

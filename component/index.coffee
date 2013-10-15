generator = require '../sojourn-generator'

class ComponentGenerator extends generator
  _define:       -> 'component'
  makeDirectory: -> super
  build:         -> super
  register:      -> super

module.exports = ComponentGenerator

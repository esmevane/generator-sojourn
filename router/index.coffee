Generator = require '../sojourn-generator'

class RouterGenerator extends Generator
  _target: 'router'

  layout:   -> super
  build:    -> super
  register: -> super

module.exports = RouterGenerator

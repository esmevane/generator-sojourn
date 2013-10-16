Generator = require '../sojourn-generator'

class ViewGenerator extends Generator
  _target: 'view'

  layout:   -> super
  build:    -> super
  register: -> super

module.exports = ViewGenerator

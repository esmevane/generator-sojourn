Generator = require '../sojourn-generator'

class PageGenerator extends Generator
  _target: 'page'

  layout:   -> super
  build:    -> super
  register: -> super

module.exports = PageGenerator

generator = require '../sojourn-generator'

class PageGenerator extends generator
  _define:       -> 'page'
  makeDirectory: -> super
  build:         -> super
  register:      -> super

module.exports = PageGenerator

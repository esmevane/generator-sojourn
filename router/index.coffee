generator = require '../sojourn-generator'

class RouterGenerator extends generator
  _define:       -> 'router'
  makeDirectory: -> super
  build:         -> super
  register:      -> super

module.exports = RouterGenerator

generator = require '../sojourn-generator'

class ViewGenerator extends generator
  _define:       -> 'view'
  makeDirectory: -> super
  build:         -> super
  register:      -> super

module.exports = ViewGenerator

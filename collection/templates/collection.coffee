class <%= _.classify(appName) %>.Collections.<%= _.classify(name) %> extends Backbone.Collection
  model: <%= _.classify(appName) %>.Models.<%= _.classify(modelName) %>
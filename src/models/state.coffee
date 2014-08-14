ObservableModel = require "./observable-model"

class State extends ObservableModel
  constructor:()->
    super null
    @name = null
    @logo = null
    @login_error = null

module.exports = State
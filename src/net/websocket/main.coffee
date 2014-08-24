events = require "./login"


init = (state, view_emitter)->
  connection = new Connection(state)
  for event in events
    event(connection, view_emitter)
  return true

module.exports = init
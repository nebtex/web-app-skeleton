try_to_login = (connection, view)->
  view.on "login-button-click", ->
    #if connection exist do nothing
    if connection.socket?
      return

    connection.state.trying_to_login = true
    connection.state.commit()
    connection.on "open",  ->
      connection.emit("login", {username:connection.state.current_user.username})

is_logged = (connection, view)->
  connection.on "logged",  (data)->
    if data.is_logged
      connection.state.is_logged = true
      connection.state.login_error = null
    else
      connection.state.is_logged = false
      connection.state.login_error = data.login_error
      connection.socket.close()
    #show the changes in the ui
    connection.state.trying_to_login = false
    connection.state.commit()

module.exports = [try_to_login, is_logged]
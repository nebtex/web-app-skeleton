root = exports ? this
mercury = require("mercury")
h = mercury.h

class LoginModalView

  constructor:(app)->
    @app = app

  app_logo:->
    properties =
      src: @app.logo
    h "app-logo", properties

  app_name:->
    h "app-name", [@app.name]

  username_input:->
    properties =
      placeholder: "Enter your username ..."
    h "username-input", properties

  login_button:->
    properties =
      "evt-click":(evt)->
        root.emmiter.emit("login-button-click")

    h "login_button", properties

  error:->
    return  if @app.login_error? and login_error!="" then h "error", [@app.login_error] else ""

  render:->
    h "login-modal", [@app_logo(), @app_name(), @username_input(), @error(), @login_button()]


module.exports = LoginModalView
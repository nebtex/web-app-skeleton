root = exports ? this
mercury = require("mercury")
h = mercury.h

class LoginModalView

  constructor:(app)->
    @app = app

  header:->
    img_properties =
      src: @app.logo
    img = h "img.app-logo", img_properties
    title = h "h1.app-name", [@app.name]

    return h "header", [img, title]

  body:->
    properties =
      "placeholder": "Enter your username ..."
    input = h "input.username", properties
    return h "article", [input, @error()]

  footer:->
    properties =
      href:"#"
      "ev-click": mercury.event (evt)->
        console.log("hihihhi")

    h "footer", [h("a.login_button", properties, ["Login"]), h("div.clear-fix")]

  error:->
    return  if @app.login_error? and @app.login_error!="" then h "span.error", [@app.login_error] else ""

  render:->
    h "section.login-modal", [@header(), @body(), @footer()]


module.exports = LoginModalView
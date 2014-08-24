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
    if @app.trying_to_login == true
      properties =
        value: @app.$current_user.name
        disabled: "disabled"
    else
      if @app.$current_user? and @app.$current_user.name?
        value = @app.$current_user.name
      else
        value = ""
      properties =
        placeholder: "Enter your username ..."
        value:value

    input = h "input.username", properties
    return h "article", [input, @error()]

  footer:->
    properties =
      href:"#"
      "ev-click": mercury.event (evt)->
        console.log("hihihhi")
    if @app.trying_to_login == true
      spinner = h "div.spinner", [h("div.rect1"), h("div.rect2"), h("div.rect3"), h("div.rect4"), h("div.rect5")]
      login_button = h("a.login_button_waiting", properties, [h("div","Login"), spinner])
    else
      login_button = h("a.login_button", properties, "Login")
    h "footer", [login_button, h("div.clear-fix")]

  error:->
    return  if @app.login_error? and @app.login_error!="" then h "div.error", [@app.login_error] else ""

  render:->
    clases = ["login-modal"]

    if @app.login_error? and @app.login_error!=""
      clases.push("login-error")
    else if @app.trying_to_login == true
      #do nothing
    else if  @app.net_error? and @app.net_error!=""
      #do nothing
    else
      clases.push("login-entrance")

    h "section."+clases.join("."), [@header(), @body(), @footer()]




module.exports = LoginModalView
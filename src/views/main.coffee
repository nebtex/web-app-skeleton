mercury = require "mercury"
h = mercury.h
LoginPage = require "./pages/login"
ChatPage = require "./pages/chat"


global_notifications =(state)->
  classes = ["global-notification"]
  if state.net_error? and state.net_error!=""
    classes.push("notification-error")
    return h "div."+classes.join("."), [h("i"), h("span",[state.net_error])]
  return ""
module.exports = class

  @render: (state)->
    login_page = new LoginPage(state)
    chat_page = new ChatPage(state)
    return h "div.main-app", [global_notifications(state), login_page.render(), chat_page.render()]
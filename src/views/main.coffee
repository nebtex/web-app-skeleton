mercury = require "mercury"
h = mercury.h
LoginPage = require "./pages/login"

module.exports = class

  @render: (state)->
    login_page = new LoginPage(state)
    return h "app", [login_page.render()]
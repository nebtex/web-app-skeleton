mercury = require "mercury"
h = mercury.h
LoginPage = require "./pages/login"

module.exports = class

  @render: (state)->
    login_page = new LoginPage(state)
    return h "main-app", [login_page.render()]
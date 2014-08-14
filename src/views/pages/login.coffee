SingleModalLayout = require "../layouts/single-modal"
LoginModalView = require "../components/login_modal"

class LoginView extends SingleModalLayout
  constructor:(state)->
    @body = new LoginModalView(state).render()

module.exports = LoginView

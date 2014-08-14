SingleModalLayout = require "../layouts/single-modal"
LoginModalView = require "../components/login_modal"

class LoginView extends SingleModalLayout
  constructor:(state)->
    super(state)
    @add_to_body(new LoginModalView(state).render())

module.exports = LoginView

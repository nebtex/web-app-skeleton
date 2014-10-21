SingleModalLayout = require "../layouts/single-modal"
LoginModalView = require "../components/login_modal"

class LoginView extends SingleModalLayout
  constructor:(state)->
    super(state)
    @add_to_body(new LoginModalView(state).render())

  render:->
    if @state.is_logged? and @state.is_logged
      return ""
    else
      return super()


module.exports = LoginView

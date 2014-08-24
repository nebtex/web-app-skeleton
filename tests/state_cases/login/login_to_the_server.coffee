clone = require("./../../../src/utils/clone")
fresh_state = require("./fresh_app_instance")

state = clone(fresh_state)
console.log(state)
state.title = "Waiting for login in"
state.description = "The user is waiting the response of the server to the login request"

state.$app_state.trying_to_login =  true
state.$app_state.$current_user =
  name: "tester"

module.exports = state
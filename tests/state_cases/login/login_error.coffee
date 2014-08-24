clone = require("./../../../src/utils/clone")
update = require("./../../../src/utils/update")

fresh_state = require("./fresh_app_instance")

base_state = clone(fresh_state)

state =
  title: "Login Error"
  description: "There exists an error with the credentials entered by the user"
  $app_state:
    login_error: "Username have invalid characters"
    $current_user:
      name: "tes @%ter"

module.exports = update(base_state, state)
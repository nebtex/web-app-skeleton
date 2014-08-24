clone = require("./../../../src/utils/clone")
update = require("./../../../src/utils/update")
base_state = clone(require("./fresh_app_instance"))

state =
  title: "Connection Error"
  description: "App cant connect to the server"
  $app_state:
    net_error: "I can't reach the server, try to login again in 10 minutes"
    $current_user:
      name: "tester"

module.exports = update(base_state, state)
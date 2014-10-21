states = {}
login_case = require("./login/all")
channel_bar_cases = require("./channels_bar/all")
states[login_case.package_name] = login_case.states
states[channel_bar_cases.package_name] = channel_bar_cases.states

module.exports = states
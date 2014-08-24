states = {}
login_case = require("./login/all")
states[login_case.package_name] = login_case.states

module.exports = states
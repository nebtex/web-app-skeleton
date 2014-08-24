states = []
states.push(require('./fresh_app_instance'))
states.push(require('./login_to_the_server'))
states.push(require('./login_error'))
states.push(require('./connection_error'))


module.exports = {states:states, package_name:"Login view"}
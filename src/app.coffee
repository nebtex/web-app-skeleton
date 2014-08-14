root = exports ? this
EventEmitter = require("events").EventEmitter
mercury = require("mercury")
root.emmiter = new EventEmitter()
render = require("./views/main").render
State = require("./models/state")
state = new State()
state.name = "mercury-chat-app"
state.logo = "img/logo.png"



mercury.app document.body, state.observable, render

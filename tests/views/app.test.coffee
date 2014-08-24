EventEmitter = require("events").EventEmitter
mercury = require("mercury")
emmiter = new EventEmitter()

render = require("./../../src/views/main").render
State = require("./../../src/models/state")
state = new State()
state_cases = require ("./../state_cases/all")
h = mercury.h

default_state = "Login view:0"
#define default state
state.app_state_path = default_state

build_state_selector = (state_cases)->
  groups = []
  for key, states of state_cases
    options = []
    for index, value of states
      properties =
        value: "#{key}:#{index}"

      if properties.value == default_state
        properties.selected = "selected"

      options.push(h('option', properties, value.title))
    groups.push(h("optgroup", {label:key}, options))
  h "select", {"ev-change":(evt)-> state.app_state_path = evt.target.value}, groups

load_state = (state)->
  [key, index] = state.app_state_path.split(":")
  state_data = state_cases[key][index]
  state.title = state_data.title
  state.description = state_data.description
  state.$app_state = state_data.$app_state


render_test = (state)->
  load_state(state)
  wrapper = h("div.test_wrapper", [render(state.$app_state)])
  select_tag = build_state_selector(state_cases)
  selector = h("p", [select_tag,
                     h("a.state_selector", {href:"#", "ev-click":(evt)->state.commit()}, "Select state"),
                     h("a.state_printer", {href:"#", title:"check the console",  "ev-click":(evt)->console.log(state)}, "Print current state")])
  footer = h("footer.test_footer", [h("h1",["State Tester"]),
                                    h("p",[h("strong", "Title:"),"  #{state.title}"]),
                                    h("p",[h("strong", "Description:"),"  #{state.description}"]),
                                    selector])
  return h("div.test", [wrapper, footer])


mercury.app document.body, state.observable, render_test
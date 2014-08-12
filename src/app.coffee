mercury = require("mercury")
h = mercury.h

inputBox = (value, sink) ->
  h "input.input",
    value: value
    name: "text"
    "data-event": mercury.changeEvent(sink)

render = (textValue) ->
  h "div", [
    h("p.content", "The value is now: " + textValue)
    h("p", [
      "Change it here: "
      inputBox(textValue, events.change)
    ])
  ]

events = mercury.input(["change"])
textValue = mercury.value("")
events.change (data) ->
  textValue.set data.text
  return

window.onload = ()->
  mercury.app document.body, textValue, render
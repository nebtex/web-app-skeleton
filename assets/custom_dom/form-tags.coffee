CustomElement = require "./base"

UsernameInput = CustomElement("username-input")

UsernameInput.createdCallback = ->
  @innerHTML = "<input type='text'>"
  return

UsernameInput.attachedCallback = ->
  @childNodes[0].setAttribute("placeholder", @placeholder)
  return

LoginButton = CustomElement("login-button")
LoginButton.createdCallback = ->
  @innerHTML = "Login"
  return

LoginButton.attachedCallback = ->
  @onclick=@["evt-click"]
  clearfix = document.createElement('clear-fix')
  @parentElement.appendChild(clearfix)
  return

module.exports = [UsernameInput, LoginButton]
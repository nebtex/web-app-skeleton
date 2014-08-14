CustomElement = require "./base"

App = CustomElement("main-app")
View = CustomElement("app-view")
ViewBody = CustomElement("view-body")
ViewFooter = CustomElement("view-footer")
LoginModal = CustomElement("login-modal")
AppLogo = CustomElement("app-logo")
AppName = CustomElement("app-name")
ClearFix = CustomElement("clear-fix")

AppLogo.createdCallback = ->
  @innerHTML = "<img />"
  return

AppLogo.attachedCallback = ->
  @childNodes[0].setAttribute("src", @logo)
  return

module.exports = [App, View, ViewBody, LoginModal, AppLogo, AppName, ClearFix]
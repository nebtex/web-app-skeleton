h = require("mercury").h

AppWithLeftLateralBar = class
  @body_elements = ["ghlglkglgu"]
  @left_lateral_bar_elements = []

  get_body:->
    return h "article", @body_elements

  add_to_body:(node)->
    @body_elements.push(node)

  get_left_lateral_bar:->
    return h "aside", @left_lateral_bar_elements

  add_to_left_lateral_bar:(node)->
    @left_lateral_bar_elements.push(node)

  layout:->
    [@get_left_lateral_bar(), @get_body()]

  render:->
    h "section.app-view.left-lateral", h("div.table-row", @layout())

module.exports = AppWithLeftLateralBar
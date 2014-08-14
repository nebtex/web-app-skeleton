h = require("mercury").h

SingleModalLayout = class
  constructor:(state)->
    date = new Date()
    current_year = date.getFullYear()
    @footer  = h "view-footer", ["Copyright (c) #{current_year} Nebular Vortex"]
    @body_elements = []

  get_body:->
    return h "view-body", @body_elements

  add_to_body:(node)->
    @body_elements.push(node)

  layout:->
    [@get_body(), @footer]

  render:->
      h "app-view", @layout()

module.exports = SingleModalLayout
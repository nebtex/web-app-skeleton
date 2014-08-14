h = require("mercury").h

SingleModalLayout = class
  constructor:()->
    date = new Date()
    current_year = date.getYear()
    @footer  = h "footer", "Copyright (c) #{current_year} Nebular Vortex"
    @body = ""

  layout:->
    [@body, @footer]

  render:->
      h "view", @layout()

module.exports = SingleModalLayout
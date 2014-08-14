tags = require "./form-tags"
tags = require("./basic-tags").concat(tags)

for tag in tags
  document.registerElement(tag._tag_name_,  prototype: tag)
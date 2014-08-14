CustomElement =(tag_name)->
  obj = Object.create(HTMLElement::)
  obj._tag_name_ = tag_name
  return obj

module.exports = CustomElement
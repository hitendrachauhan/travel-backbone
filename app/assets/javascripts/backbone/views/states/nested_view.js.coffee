TravelBackbone.Views.States ||= {}

class TravelBackbone.Views.States.NestedView extends Backbone.View

  render: ->
    @$el.html("<div class='list-group panel' id='main'></div>")
    @collection.each ((model) ->
      @renderElement model
      return
    ), this
    return this

  renderElement: (model) ->
    ul = @getParentDiv(model)
    @appendElement ul, model
    return
  getParentDiv: (model) ->
    ul = @$el.find('#ul-' + model.get('state_id'))
    if ul.length == 0
      @appendListInElement model
      ul = @$el.find('#ul-' + model.get('state_id'))
    ul
  appendListInElement: (model) ->
    li = @$el.find('#li-' + model.get('state_id'))
    li.after '<ul id=\'ul-' + model.get('state_id') + '\'></ul>'
    return
  appendElement: (ul, model) ->
    ul.append '<li id=\'li-' + model.get('id') + '\'>' + model.get('name') + '</li>'
    return

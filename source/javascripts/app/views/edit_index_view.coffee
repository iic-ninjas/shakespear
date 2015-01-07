class EditIndexChildView extends Marionette.ItemView
  tagName: 'tr'
  template: '#edit-index-view'

  ui:
    startAt: '#startAtInSeconds'

  onRender: ->
    @ui.startAt.val(@model.get('startAtInSeconds'))
    if !@model.canEdit()
      @$el.find('input').attr('disabled', true)

  events:
    'change input': 'updateField'

  updateField: (ev)->
    el = $(ev.target)
    key = el.attr('id')
    value = el.val()
    if key == 'startAtInSeconds'
      value = parseInt(value)
    el.attr('disabled', true)
    @model.set(key, value)
    @model.save({},
      success: -> el.attr('disabled', false)
      error: -> el.attr('disabled', false)
    )

class Shake.Views.EditIndexView extends Marionette.CollectionView
  childView: EditIndexChildView
  tagName: 'table'
  className: 'table'

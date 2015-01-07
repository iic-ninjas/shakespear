class PlayIndexChildView extends Marionette.ItemView
  template: '#play-index-view'
  tagName: 'a'
  className: 'list-group-item play-item'
  attributes: { href: '#' }

  events:
    'click': 'triggerAction'

  triggerAction: (ev)->
    ev.preventDefault()
    @trigger('clickedSong', @model)

  active: (toggle = true) ->
    @$el.toggleClass('active', toggle)

class Shake.Views.PlayIndexView extends Marionette.CollectionView
  className: 'list-group'
  childView: PlayIndexChildView

  activateSong: (song) ->
    @children.each (view) ->
      view.active(view.model.get('objectId') == (song.id || song.get('objectId')))


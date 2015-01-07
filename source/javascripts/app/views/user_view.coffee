class Shake.Views.UserView extends Marionette.ItemView
  el: '#user-view'

  template: (obj) ->
    if (user = Parse.User.current())
      _.template($('#user-signed-in-template').html())(user.toJSON())
    else
      _.template($('#user-signed-out-template').html())()

  events:
    'click a': (ev) -> ev.preventDefault()

  triggers:
    'click #sign-in': 'sign-in'
    'click #sign-out': 'sign-out'

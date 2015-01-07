#= require_self
#= require_tree ./models
#= require_tree ./views
#= require_tree ./controllers

window.Shake = new Marionette.Application()
window.Shake.addRegions(
  top: '.top'
  main: '.main'
)

Shake.Models = {}
Shake.Views = {}
Shake.Controllers = {}

Shake.addInitializer (options) ->
  Backbone.history.start()

Parse.initialize("uwdostKJHj59UqMPm8pS6XO6OspSXBOy7s1IHkJo", "o0IPafacxdIuNIbsirAkULxMn2p28fBMbu7l0abY")
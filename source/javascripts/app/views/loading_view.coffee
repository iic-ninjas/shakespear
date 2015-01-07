class Shake.Views.LoadingView extends Marionette.ItemView
  template: "#loading-view"

Shake.showLoading = ->
  Shake.main.show(new Shake.Views.LoadingView())

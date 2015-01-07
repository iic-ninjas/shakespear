class Shake.Controllers.Edit
  constructor: ->
    if window.songs
      @songs = window.songs
    else
      @songs = new Shake.Models.Songs()
      window.songs = @songs

  edit: (cb = ()->)->
    Shake.top.empty()
    Shake.showLoading()
    @songs.fetch(
      success: =>
        @editView = new Shake.Views.EditIndexView(collection: @songs)
        Shake.main.show(@editView)
        cb()
    )
    Shake.on('adminity-changed', =>
      @editView.render()
    )

Edit = new Marionette.AppRouter(
  controller: new Shake.Controllers.Edit(),
  appRoutes: {
    "edit": "edit"
  }
)

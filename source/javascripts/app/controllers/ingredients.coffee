class Shake.Controllers.Ingredients
  constructor: ->
    @ingredients = new Shake.Models.Ingredients()

  index: (cb = ()->)->
    Shake.showLoading()
    Shake.top.empty()
    @ingredients.fetch(
      success: =>
#        backboneSongs = new Backbone.Collection(@songs.toJSON())
#        @collectionView = new Shake.Views.PlayIndexView(collection: backboneSongs)
#        @collectionView.on('childview:clickedSong', (view, song) =>
#          @showSong(song)
#          Backbone.history.navigate("play/#{song.get('objectId')}")
#        )
#        Shake.main.show(@collectionView)
        cb()
    )

PlayRouter = new Marionette.AppRouter(
  controller: new Shake.Controllers.Ingredients(),
  appRoutes: {
    "": "index",
  }
)

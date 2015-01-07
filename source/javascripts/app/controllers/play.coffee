class Shake.Controllers.Play
  constructor: ->
    @songs = new Shake.Models.Songs()
    window.songs = @songs

  index: (cb = ()->)->
    Shake.showLoading()
    Shake.top.empty()
    @songs.fetch(
      success: =>
        backboneSongs = new Backbone.Collection(@songs.toJSON())
        @collectionView = new Shake.Views.PlayIndexView(collection: backboneSongs)
        @collectionView.on('childview:clickedSong', (view, song) =>
          @showSong(song)
          Backbone.history.navigate("play/#{song.get('objectId')}")
        )
        Shake.main.show(@collectionView)
        cb()
    )

  play: (id) ->
    @index =>
      song = @songs.get(id)
      @showSong(song)

  showSong: (song) ->
    Shake.top.show(new Shake.Views.PlayView(model: song))
    @collectionView.activateSong(song)


PlayRouter = new Marionette.AppRouter(
  controller: new Shake.Controllers.Play(),
  appRoutes: {
    "": "index",
    "play/:id": "play"
  }
)

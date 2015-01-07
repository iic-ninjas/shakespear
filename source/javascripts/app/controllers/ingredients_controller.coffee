class Shake.Controllers.IngredientsController
  constructor: ->
    @ingredients = new Shake.Models.Ingredients()

  index: ->
    Shake.showLoading()
    Shake.top.empty()
    @ingredients.fetch(
      success: =>
        @collectionView = new Shake.Views.IngredientsListView(collection: @ingredients)
        Shake.main.show(@collectionView)
    )

PlayRouter = new Marionette.AppRouter(
  controller: new Shake.Controllers.IngredientsController()
  appRoutes:
    "": "index"
)

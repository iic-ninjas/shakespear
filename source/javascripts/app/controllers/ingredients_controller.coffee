class Shake.Controllers.IngredientsController
  constructor: ->
    @ingredients = new Shake.Models.Ingredients()
    @currentShake = new Shake.Models.Shake()

  index: ->
    Shake.showLoading()
    Shake.top.empty()
    @ingredients.fetch(
      success: =>
        Shake.main.show(new Shake.Views.CreateShakeView(model: @currentShake, collection: @ingredients))
    )

PlayRouter = new Marionette.AppRouter(
  controller: new Shake.Controllers.IngredientsController()
  appRoutes:
    "": "index"
)

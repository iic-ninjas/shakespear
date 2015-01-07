class Shake.Views.IngredientView extends Marionette.ItemView
  template: "#ingredient-view"

class Shake.Views.CreateShakeView extends Marionette.CompositeView
  template: "#shake-form-view"
  childView: Shake.Views.IngredientView
  childViewContainer: '.ingredient-list'


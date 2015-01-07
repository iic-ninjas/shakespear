class Shake.Views.IngredientView extends Marionette.ItemView
  template: "#ingredient-view"

class Shake.Views.IngredientsListView extends Marionette.CollectionView
  childView: Shake.Views.IngredientView

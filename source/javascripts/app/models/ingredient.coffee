class Shake.Models.Ingredient extends Parse.Object
  className: "Ingredient"
  defaults:
    name: null

class Shake.Models.Ingredients extends Parse.Collection
  model: Shake.Models.Ingredient

  comparator: (ingredient) -> ingredient.get('name')

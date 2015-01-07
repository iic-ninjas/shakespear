class Shake.Views.IngredientView extends Marionette.ItemView
  template: "#ingredient-view"
  className: 'ingredient'

  events:
    'click': '_onClick'

  _onClick: ->
    @$el.toggleClass('selected', !@$el.hasClass('selected'))

class Shake.Views.CreateShakeView extends Marionette.CompositeView
  template: "#shake-form-view"
  childView: Shake.Views.IngredientView
  childViewContainer: '.ingredient-list'

  ui:
    nameInput: '.name'

  events:
    'click .submit-btn': '_onSubmit'

  _onSubmit: ->
    @model.relation('ingredients').add(@collection.first())
    @model.set(name: @ui.nameInput.val())
    @model.save(null, success: -> alert('yey'))


class Shake.Views.IngredientView extends Marionette.ItemView
  template: "#ingredient-view"
  className: 'ingredient'

  events:
    'click': '_onClick'

  onRender: ->
    @$el.data(id: @model.id)

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
    ingredientsIds = @$el.find('.ingredient.selected').map((i, el) -> $(el).data('id'))
    collection = _.map(ingredientsIds, (id) => @collection.get(id))
    @model.relation('ingredients').add(collection)
    @model.set(name: @ui.nameInput.val())
    @model.save(null, success: -> window.location.reload())


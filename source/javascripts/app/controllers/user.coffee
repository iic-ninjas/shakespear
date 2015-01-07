class Shake.Controllers.User
  isAdmin: false

  constructor: ->
    @userView = new Shake.Views.UserView()
    @userView.render()
    @userView.on('sign-in', @signIn)
    @userView.on('sign-out', @signOut)
    @testAdminity()

  signOut: =>
    Parse.User.logOut()
    @userView.render()
    window.location.reload()

  signIn: =>
    Parse.FacebookUtils.logIn null,
      success: (user) =>
        FB.api('/me', (fb_user) =>
          user.save(
            first_name: fb_user.first_name
            last_name: fb_user.last_name
            display_name: fb_user.name
            avatar: "http://graph.facebook.com/#{fb_user.id}/picture"
          )
          @userView.render()
        )
        if user.get('avatar')?
          @userView.render()
        user.setACL(new Parse.ACL(user));
        @testAdminity()

      error: (user, error) ->
        console.log("User cancelled the Facebook login or did not fully authorize.")

  testAdminity: =>
    return unless Parse.User.current()
    query = new Parse.Query(Parse.Role)
    query.equalTo("name", "administrator")
    query.equalTo("users", Parse.User.current())
    query.first().then((adminRole) =>
      @isAdmin = !!adminRole
      Shake.trigger('adminity-changed')
    )


Shake.addInitializer (options) ->
  Shake.userController = new Shake.Controllers.User()

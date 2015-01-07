class Shake.Models.Song extends Parse.Object
  className: "Song"
  defaults:
    startAtInSeconds: 0

  toJSON: ->
    _.extend(super(),
      youtubeUrl: @youtubeUrl()
      initials: @initials()
    )

  initials: ->
    _.map(@get('user').split(" "), (x) -> return x[0]).join("")

  youtubeUrl: ->
    "https://www.youtube.com/embed/#{@get('youtubeId')}?autoplay=1&start=#{@get('startAtInSeconds')}"

  canEdit: ->
    return false unless Parse.User.current()
    acl = @getACL()
    acl.getPublicWriteAccess() || acl.getWriteAccess(Parse.User.current()) || Shake.userController.isAdmin

class Shake.Models.Songs extends Parse.Collection
  model: Shake.Models.Song

  comparator: (song) -> song.get('user')

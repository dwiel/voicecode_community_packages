pack = Packages.register
  name: "media chrome"
  description: "commands for controlling media playback in chrome"

pack.commands
  enabled: true
,
  "media-play-pause":
    spoken: "media play"
    description: "play or pause media playback in chrome"
    action: (input) ->
      @key "1", "shift command"
  "media-pause":
    spoken: "media pause"
    description: "play or pause media playback in chrome"
    action: (input) ->
      @key "1", "shift command"
  "media-next":
    spoken: "media next"
    description: "play next song media playback in chrome"
    action: (input) ->
      @key "2", "shift command"
  "media-previous":
    spoken: "media previous"
    description: "play previous song media playback in chrome"
    action: (input) ->
      @key "9", "shift command"
  "media-like":
    spoken: "media like"
    description: "like current song in media played back in chrome"
    action: (input) ->
      @key "8", "shift command"
  "media-home":
    spoken: "media home"
    description: "switch to media desktop and navigate to home page youtube"
    action: (input) ->
      @key "6", "control"
      @delay 500
      @openApplication('Google Chrome')
      # TODO: insetad of delay, wait until currenta pplication is chrome
      @delay 500
      @key "1", "command"
      @key "l", "command"
      @string "youtube.com"
      @key "enter"
  "media-search":
    spoken: "media search"
    description: "switch to media desktop and search youtube"
    action: (input) ->
      @key "6", "control"
      @delay 500
      @openApplication('Google Chrome')
      # TODO: insetad of delay, wait until currenta pplication is chrome
      @delay 500
      @key "1", "command"
      @key "/"
      if input
        @string input
        @key "enter"

pack = Packages.register
  name: "amethyst"
  description: "change view of windows.  Many of these shortcuts depend on Amethyst"

pack.settings
  screen_mapping:
    '1': 'w'
    '2': 'e'
    '3': 'r'
    '4': 't'

pack.api
  window_screen:
    action: (window) ->
      @key pack.settings().screen_mapping[window.toString()], 'control option shift'

pack.commands
  enabled: true
,
  "window next screen":
    spoken: "window next screen"
    misspellings: ["window move screen right", "window screen right"]
    description: "move the current window onto the next screen"
    action: ->
      @key 'l', 'shift control option'

  "window previous screen":
    spoken: "window preev screen"
    misspellings: ["window previous screen", "window move screen left", "window screen left"]
    description: "move the current window onto the previous screen"
    action: ->
      @key 'h', 'shift control option'

  "window next":
    spoken: "window next"
    description: "move the focus to next window"
    action: ->
      @key 'j', 'option shift'

  "window previous":
    spoken: "window previous"
    description: "move the focus to previous window"
    action: ->
      @key 'k', 'option shift'

  "window move desktop":
    spoken: "window move desk"
    description: "move focused window to desktop n"
    grammarType: 'integerCapture'
    action: (input) ->
      if input?
        @key input.toString(), 'control option shift'

  "desktop n":
    spoken: "desk"
    description: "move to desktop n"
    grammarType: 'integerCapture'
    action: (input) ->
      if input?
        if input > 10
          @key input.toString()[-1], 'control option'
        else
          @key input.toString(), 'control'

  "window-screen-n":
    spoken: "window screen"
    description: "move window to screen n"
    grammarType: 'integerCapture'
    action: (input) ->
      if input?
        @window_screen(input)

  "rearrange windows":
    spoken: "window rearrange"
    description: "rearrange windows on screen based on application"
    action: ->
      @exec 'open -a Atom'
      @delay 100
      @window_screen(1)
      @do 'window:next'
      @window_screen(1)
      @do 'window:next'
      @window_screen(1)

      @exec 'open -a "Google Chrome"'
      @delay 100
      @window_screen(2)
      @do 'window:next'
      @window_screen(2)
      @do 'window:next'
      @window_screen(2)

      @exec 'open -a "iTerm"'
      @delay 100
      @window_screen(2)
      @do 'window:next'
      @window_screen(2)
      @do 'window:next'
      @window_screen(2)

      # @exec 'open -a "Voicecode"'
      # @delay 100
      # @window_screen(2)

  "window fullscreen layout":
    spoken: "window full"
    misspellings: ["window full-screen"]
    description: "switch to fullscreen layout"
    action: ->
      @key 'd', 'option shift'

  "window tall layout":
    spoken: "window tall"
    description: "switch to tall layout"
    action: ->
      @key 'a', 'option shift'

  "window middle tall layout":
    spoken: "window middle"
    description: "switch to middle tall layout"
    action: ->
      @key '`', 'control option shift'

  "window move main":
    spoken: "window move main"
    description: "make focused window the main window"
    action: ->
      @key 'enter', 'option shift'

  "window grow":
    spoken: "window grow"
    description: "increase size of main window"
    action: (input) ->
      @key 'L', 'option shift'

  "window shrink":
    spoken: "window shrink"
    description: "decrease size of main window"
    action: (input) ->
      @key 'H', 'option shift'

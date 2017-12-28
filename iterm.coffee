pack = Packages.register
  name: "terminal"
  applications: ["com.googlecode.iterm2"]
  description: "automatically generated package for iTerm"

Settings.vocabulary =
  vocabulary: [
    'itermocil'
  ]

pack.settings
  options:
    'coach': 'coach'
    'tensorflow hmm': 'tensorflow_hmm'
    'dspace': 'dspace'
    'arm': 'arm'

pack.implement
  "common:save": ->
    @key "Escape"
    @string ":w"
    @key "Enter"
  "window:close": ->
    @key "Escape"
    @string ":q"
    @key "Enter"
  'os:undo': ->
    @key "Escape"
    @key 'u'
  'cursor:way-down': ->
    @key 'G'
  'cursor:way-up': ->
    @string 'gg'
  'editor:toggle-comments': ({first, last} = {}) ->
    @string "gc"
    @string first
    @string last
  'delete:lines': ({first, last} = {}) ->
    @key "Escape"
    if last?
      # @runAtomCommand 'selectLineRange',
      #   from: first
      #   to: last
      # , true
    else if first?
      @string first
      @string 'gg'
    @string 'dd'

pack.commands
  "deal":
    spoken: "deal"
    description: "delete inside of vi"
    enabled: true
    action: (input) ->
      @key "d"
  "deal line":
    spoken: "dealine"
    description: "delete line inside of vi"
    enabled: true
    action: (input) ->
      @string "dd"
  # "go to definition":
  #   spoken: "go to definition"
  #   description: "go to definition inside of vi"
  #   enabled: true
  #   action: (input) ->
  #     @key "]", 'control'
  'focus center':
    spoken: 'focus center'
    description: 'first so the cursor is in the center vertically'
    enabled: true
    action: (input) ->
      @key "Escape"
      @string "zz"
  'focus top':
    spoken: 'focus top'
    description: 'first so the cursor is in the top vertically'
    enabled: true
    action: (input) ->
      @key "Escape"
      @string "zt"
  'focus bottom':
    spoken: 'focus bottom'
    description: 'first so the cursor is in the bottom vertically'
    enabled: true
    action: (input) ->
      @key "Escape"
      @string "zb"
  'class next':
    spoken: 'class next'
    description: 'move cursor to next definition of class'
    enabled: true
    action: (input) ->
      @string ']]'
  'class previous':
    spoken: 'class preev'
    description: 'move cursor to previous definition of class'
    enabled: true
    action: (input) ->
      @string '[['

# pack.implement
#   "editor:reformat":
#     action: ->
#       @key "Escape"
#       @string ",y"
#
pack.commands
  enabled: true
,
  "tarpy":
    spoken: "tarpy"
    description: "2 tabs useful in the commandline"
    action: (input) ->
      @key 'tab'
      @key 'tab'
  "dash":
    spoken: "dash"
    description: "'dash brov' -> '-b '; 'dash hello' -> '--hello '; 'dash hello world' -> '--hello-world '"
    autoSpacing: 'normal normal'
    multiPhraseAutoSpacing: 'normal normal'
    grammarType: "textCapture"
    action: (input) ->
      if input
        if input.length == 1 and input[0].length == 1
          @string "-"
          @string input
          @string ""
        else
          @string "--"
          @string input.join("-")
          @string ""
      else
        @string "-"

  "buffer list":
    spoken: "buffer list"
    description: "list buffers in vim"
    action: (input) ->
      @key "Escape"
      @string ':buffers'
      @key 'enter'
      @string ':buffer '
  'fuzzy file':
    spoken: 'fuzzy file'
    description: 'open new fuzzy file: :FZF'
    enabled: true
    action: (input) ->
      @key "Escape"
      @string ':FZF'
      @key 'enter'
      @delay 500
      if input?
        @string input
        @key 'enter'

pack.implement 'atom:pane-control': ({paneAction, whichPane}) ->
  switch paneAction
    when 'split'
      switch whichPane
        when 'right'
          @key "Escape"
          @string ':botright vsplit'
          @key 'enter'
    when 'fog'
      switch whichPane
        when 'right'
          @key "Escape"
          @key 'w', 'control'
          @key 'l'
        when 'left'
          @key "Escape"
          @key 'w', 'control'
          @key 'h'
        when 'down'
          @key "Escape"
          @key 'w', 'control'
          @key 'j'
        when 'up'
          @key "Escape"
          @key 'w', 'control'
          @key 'k'


pack.commands
  enabled: true
,
  "window equal":
    spoken: "window equal"
    description: "equalize window sizes in vim"
    action: (input) ->
      @key 'w', 'control'
      @key '='
  "window left":
    spoken: "window left"
    description: "move focus to window on the left"
    action: (input) ->
      @key "Escape"
      @key 'w', 'control'
      @key 'h'
  "window right":
    spoken: "window right"
    description: "move focus to window on the right"
    action: (input) ->
      @key "Escape"
      @key 'w', 'control'
      @key 'l'
  "window down":
    spoken: "window down"
    description: "move focus to window on the down"
    action: (input) ->
      @key "Escape"
      @key 'w', 'control'
      @key 'j'
  "window up":
    spoken: "window up"
    description: "move focus to window on the up"
    action: (input) ->
      @key "Escape"
      @key 'w', 'control'
      @key 'k'
  "rename variable":
    spoken: "rename variable"
    description: "rename variable in vi using rope"
    action: (input) ->
      @key "Escape"
      @key 'c', 'control'
      @key 'r'
      @key 'r'
  "make dur":
    spoken: "make dur"
    description: "create a new directory"
    misspellings: ['victor']
    continuous: true
    action: (input) ->
      @string "mkdir "
  "dash dash":
    spoken: "dash dash"
    description: "ensure that a space comes before --"
    action: (input) ->
      @string " --"
  "recursive grep":
    spoken: "recursive grep"
    description: "grep _ * -r"
    action: (input) ->
      @string "grep  * -r"
      @left()
      @left()
      @left()
      @left()
      @left()
  "activate virtual environment":
    spoken: "activate virtual environment"
    description: "activate virtual environment"
    action: (input) ->
      @string "source `find . | grep bin/activate$`"
      @key "Enter"

  "fuzzy-home":
    spoken: "fuzzy home"
    description: "~/**"
    action: (input) ->
      @string '~/**'
      @key 'tab'

  "fuzzy-folder":
    spoken: "fuzzy folder"
    description: "**"
    action: (input) ->
      @string '**'
      @key 'tab'

  "ssh-thinkpad":
    spoken: "ssh thinkpad"
    description: "mosh into thinkpad machine"
    action: (input) ->
      @string 'mosh dwiel@dwiel-thinkpad'
      @key 'enter'
      @do 'terminal:tmux-list'
  "ssh-arm":
    spoken: "ssh arm"
    description: "mosh into arm machine"
    action: (input) ->
      @string 'mosh dwiel@192.168.1.117'
      @key 'enter'
      @do 'terminal:tmux-list'
  "itermocil-restore":
    spoken: 'iterm restore'
    autoSpacing: 'normal always'
    multiPhraseAutoSpacing: 'normal normal'
    description: "restore iterm windows with itermocil"
    grammarType: 'custom'
    rule: '<spoken> (profile)'
    variables:
      profile: -> pack.settings().options
    action: ({profile}) ->
      if profile?
        @string "itermocil #{profile} --here"
        @key 'enter'
      else
        @string 'iterm restore'

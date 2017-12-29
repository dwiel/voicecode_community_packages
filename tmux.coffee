pack = Packages.register
  name: "terminal tmux"
  applications: ["com.googlecode.iterm2"]
  description: "tmux"

pack.commands
    enabled: false
  ,
  "tmux-list":
    spoken: "tmux list"
    description: "list tmux sessions: tmux ls"
    action: (input) ->
      @string 'tmux ls'
      @key 'enter'
  "tmux-new-session":
    spoken: "tmux new session"
    description: "tmux new session: tmux new -s $1"
    grammarType: 'textCapture'
    action: (input) ->
      @string 'tmux new -s '
      if input
        @string input.join('_')
        @key 'enter'
  "tmux-attach":
    spoken: "tmux attach"
    description: "tmux attach: tmux a -t $1"
    grammarType: 'textCapture'
    action: (input) ->
      @string 'tmux a -t '
      if input
        @string input.join('_')
        @key 'enter'
  "tmux-detach":
    spoken: "tmux detach"
    description: "tmux detach: ctrl-b d"
    action: (input) ->
      @key 'b', 'control'
      @key 'd'
  "tmux-detach-others":
    spoken: "tmux detach others"
    description: "tmux detach others: ctrl-b D"
    action: (input) ->
      @key 'b', 'control'
      @key 'd', 'shift'
  "tmux-scroll":
    spoken: "tmux scroll"
    description: "tmux scroll: ctrl-b ["
    action: (input) ->
      @key 'b', 'control'
      @key '['
  "tmux-window":
    spoken: "tmux window"
    description: "tmux change window: ctrl-b $1"
    grammarType: 'integerCapture'
    action: (input) ->
      @key 'b', 'control'
      @key input
  "tmux-window-new":
    spoken: "tmux window new"
    description: "tmux new window: ctrl-b c"
    action: (input) ->
      @key 'b', 'control'
      @key 'c'
  "tmux-window-rename":
    spoken: "tmux window rename"
    description: "tmux rename window: ctrl-b ,"
    action: (input) ->
      @key 'b', 'control'
      @key ','
  "tmux-window-find":
    spoken: "tmux window find"
    description: "tmux find window: ctrl-b f"
    action: (input) ->
      @key 'b', 'control'
      @key 'f'
  "tmux-window-close":
    spoken: "tmux window close"
    description: "tmux close window: ctrl-b &"
    action: (input) ->
      @key 'b', 'control'
      @key '&'

pack = Packages.register
  name: "smart nav"
  description: "interact with smart nav"

pack.commands
  enabled: false
,
  "center mouse":
    spoken: "center mouse"
    description: "center the mouse in the current screen"
    continuous: false
    action: ->
      @key 'control', 'shift', 'c'

pack = Packages.register
  name: "smart nav"
  description: "interact with smart nav"

pack.commands
  "center mouse":
    spoken: "center mouse"
    description: "center the mouse in the current screen"
    continuous: false
    enabled: true
    action: ->
      @key 'control', 'shift', 'c'

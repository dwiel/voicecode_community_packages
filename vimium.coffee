enabled = false

if enabled
  pack = Packages.register
    name: "vimium"
    createScope: true
    applications: -> Settings.os.browserApplications
    description: "package for vimium plug-in for chrome"

  pack.implement
    "object:duplicate": ->
      @key "y"
      @key "t"

  pack.commands
    enabled: true
  ,
    "focus-input-abc":
      spoken: "focus input"
      description: "focus cursor on topmost input box"
      enabled: true
      action: (input) ->
        @key "escape"
        @key "g"
        @key "i"

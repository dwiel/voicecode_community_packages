pack = Packages.register
  name: "lastpass"
  description: "commands for interfacing with lastpass in chrome plug-in"
  createScope: true
  applications: -> Settings.os.browserApplications

pack.commands
  enabled: false
,
  'last-pass-next':
    spoken: 'last pass next'
    action: ->
      @key 'pageup', 'command'
  'last-pass-preev':
    spoken: 'last pass preev'
    action: ->
      @key 'pagedown', 'command'

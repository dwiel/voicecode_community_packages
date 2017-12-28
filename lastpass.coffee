pack = Packages.register
  name: "lastpass"
  createScope: true
  applications: -> Settings.os.browserApplications

pack.commands
  enabled: true
,
  'last-pass-next':
    spoken: 'last pass next'
    action: ->
      @key 'pageup', 'command'
  'last-pass-preev':
    spoken: 'last pass preev'
    action: ->
      @key 'pagedown', 'command'

pack = Packages.register
  name: "custom outlook"
  applications: ["com.microsoft.Outlook"]
  description: "custom commands for outlook"

pack.commands
  "reply-to-email":
    spoken: "reply to e-mail"
    misspoken: 'reply email'
    description: "reply to email"
    enabled: true
    action: (input) ->
      @key 'r', 'command'
  "send-email":
    spoken: "send e-mail"
    description: "send email"
    enabled: true
    action: (input) ->
      @key 'enter', 'command'
  "clear-flag":
    spoken: "clear flag"
    description: "clear flag"
    enabled: true
    action: (input) ->
      @do 'os:openMenuBarPath', ['Message', 'Follow Up', 'Clear Flag']

pack.implement
  'object:previous': -> @key '[', 'control'
  'object:next': -> @key ']', 'control'
  'object:backward': -> @key '[', 'shift control'
  'object:forward': -> @key ']', 'shift control'

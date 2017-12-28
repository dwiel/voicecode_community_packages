pack = Packages.register
  name: "Voice Commands VUI"
  description: "a set of commands to make it easy to create new voice code commands search"

pack.commands
  "voice-create-command":
    spoken: "voice create command"
    description: "create a voice code command and a pop up GUI"
    action: (input) ->
      @exec("""/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome --app='http://127.0.0.1:8080/static/create_command.html'""")
      @openApplication("Google Chrome")

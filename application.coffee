pack = Packages.register
  name: "application-enhancements"
  description: "alternate application switcher for VoiceCode"

pack.commands
  "switch-application":
    spoken: "fox"
    description: """
      Alternate version of 'application:open-application'.
      Switches between open applications but does not try to launch an application.
      'Settings.application.applications' is ignored.
      Be sure to disable 'application:open-application' before enabling this command.
      Matches are partial, i.e.: 'fox tree', will work better than 'fox source tree' as the application is named 'Sourcetree'.
    """
    continuous: false
    enabled: false
    grammarType: "textCapture"
    action: (input) ->
      switchTo = input.join(' ').toLowerCase()
      ws = $.NSWorkspace('sharedWorkspace')
      len = ws('runningApplications')('count')
      for i in [0...len] by 1
        name = ws('runningApplications')('objectAtIndex', i)('localizedName').toString()
        # console.log i, name, switchTo
        if name.toLowerCase().includes(switchTo)
          console.log "activate: #{name}"
          @applescript "tell application \"#{name}\" to activate"
          break

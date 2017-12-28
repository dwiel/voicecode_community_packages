pack = Packages.register
  name: 'timer'
  description: 'Commands to manage timers'

pack.settings
  notify: true
  speech: false
  voice: 'Bruce'

pack.commands
  continuous: false
,
  'start-new':
    spoken: 'set timer'
    description: 'Start a new timer for [X] minutes'
    grammarType: 'integerCapture'
    action: (minutes) ->
      notify "#{minutes} minutes and counting"
      setTimeout =>
        if Settings.timer.notify
          notify "#{minutes} MINUTES"
        if Settings.timer.speech
          @applescript """
            say "#{minutes} minutes"
          """
      , minutes * 1000 * 60

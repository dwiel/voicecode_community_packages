pack = Packages.register
	name: 'iterm-tabrat'
	description: 'Extra util commands for iTerm2, like navigation and screen clearing'
	platforms: ['darwin']
	application: 'com.googlecode.iterm2'

# Recommended to follow setup: http://voicecode.io/doc/iterm2-setup

pack.settings
	# Follow configuration under Advanced -> "Suppress warning about broadcasting input" -- defaults to false
	suppressedWarnings: false
	# Follow configuration under Keys -> Navigation Shortcuts
	switchTabModifier: 'command'
	switchPaneModifier: 'option'
	switchWindowModifier: 'command option'

# Regular commands like 'peach' and 'totch', for opening and closing tabs respectively, still works.

pack.commands
	enabled: false
,
	"focus-tab":
		spoken: "tab focus"
		description: "focuses a tab by number"
		grammarType: "integerCapture"
		action: (input) ->
			if input
				@key input, pack.settings().switchTabModifier
	"focus-pane":
		spoken: "pane focus"
		description: "focuses a pane by number"
		misspellings: ["pain focus"]
		grammarType: "integerCapture"
		action: (input) ->
			if input
				@key input, pack.settings().switchPaneModifier
	"focus-window":
		spoken: "window focus"
		description: "focuses a window by number"
		grammarType: "integerCapture"
		action: (input) ->
			if input
				@key input, pack.settings().switchWindowModifier		
	"split-pane-vertically":
		spoken: "split vertical"
		description: "splits the current pane vertically"
		action: ->
			@key 'd', 'command'
	"split-pane-horizontally":
		spoken: "split horizontal"
		description: "splits the current pane horizontally"
		action: ->
			@key 'd', 'shift command'
	"broadcast-input-to-all-panes-for-tab":
		spoken: "broadcaster"
		description: "toggles broadcasting of input to all panes in current tab"
		action: ->
			if not pack.settings.suppressedWarnings
				@enter()
			@key 'i', 'option command'
	"clear-current-session":
		spoken: "clear session"
		description: "clears the current session"
		action: ->
			@key 'i', 'option shift command'
			@clearsession()
	"clear-all-sessions":
		spoken: "clear all"
		description: "clears all sessions in current tab"
		action: ->
			@key 'i', 'option shift command'
			@do 'iterm-utils:broadcast-input-to-all-panes-for-tab'
			if not pack.settings.suppressedWarnings
				@enter()
			@clearsession()
			@key 'i', 'option shift command'
	"exit-session":
		spoken: "exit session"
		description: "exits the current session"
		action: ->
			@key 'c', 'control'
			@string 'exit'
			@enter()

pack.actions
	clearsession: ->
		@key 'c', 'control'
		@string 'clear'
		@enter()
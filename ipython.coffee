pack = Packages.register
  name: 'jupyter'
  description: 'Commands for ipython notebook'
  createScope: true
  applications: -> Settings.os.browserApplications
  # condition: -> @inBrowser() and @urlContains '.ipynb'

# Packages.await 'chrome', (chrome) ->
#   chrome.implement
#     'os:get-selected-text': ->
#       return ''
#
pack.commands
  enabled: false
,
  'jupyter-pallet':
    spoken: 'jupiter pallet'
    description: 'open jupyter notebooks command palette'
    action: ->
      @key 'p', 'command shift'
  'cell-run':
    spoken: 'cell run'
    misspellings: ['selrang']
    description: 'run the currently selected cell'
    action: ->
      @key 'enter', 'shift'
  'cell-remove':
    spoken: 'cell delete'
    misspellings: ['sell delete']
    description: 'remove the currently selected cell'
    action: ->
      @key 'escape'
      @key 'd'
      @key 'd'
  'cell-merge-down':
    spoken: 'cell merge down'
    description: 'merge the current cell with the one below it'
    action: ->
      @do 'jupyter:jupyter-pallet'
      @delay 100
      @string 'merge cell with next cell'
      @delay 100
      @key 'enter'
  'cell-merge-up':
    spoken: 'cell merge up'
    description: 'merge the current cell with the one above it'
    action: ->
      @do 'jupyter:jupyter-pallet'
      @delay 100
      @string 'merge cell with previous cell'
      @delay 100
      @key 'enter'
  'restart-and-run':
    spoken: 'restart and run'
    description: 'restart kernel and run all cells'
    action: ->
      @do 'jupyter:jupyter-pallet'
      @delay 100
      @string 'confirm restart kernel and run all cells'
      @delay 250
      @key 'enter'
      @delay 250
      @key 'enter'

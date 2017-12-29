enabled = false

if enabled
  fast_on_off = Packages.register
    name: 'fast-on-off'
    description: 'a bunch of fast_on_off commands'
    condition: -> true

  fast_on_off.commands
    enabled: true
  ,
    'wake-up':
      spoken: 'wake up'
      misspellings: ['wakeup']
      action: ->
        @sleeping = false
    'snoring':
      spoken: 'snoring'
      misspellings: ['snore in']
      action: ->
        @sleeping = true
        notify 'ZzzZz'

  Chain.preprocess fast_on_off, (chain) ->
    return chain unless Actions.sleeping
    _.dropWhile chain, _.negate _.iteratee ['command','fast-on-off:wake-up']

  fast_on_off.implement {weight: -100},
    'dragon_darwin:microphone-sleep': ->
      @sleeping = true
      notify 'ZzzZz'

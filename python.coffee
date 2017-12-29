enabled = false

if enabled
  pack = Packages.register
    name: "python"
    description: "commands for writing python"

  Settings.vocabulary =
    vocabulary: [
      'dict'
    ]

  Settings.insert =
    abbreviations:
      'dictionary': 'dict'

  pack.commands
    enabled: true
  ,
    "if name main":
      spoken: "if name maine"
      description: "if name main"
      action: (input) ->
        @string 'if __name__ == "__main__":'
        @key 'enter'
    "length of":
      spoken: "length of"
      description: "insert len()"
      autoSpacing: 'always never'
      action: (input) ->
        @string 'len()'
        @key 'left'
    # "print":
    #   spoken: "print"
    #   description: "print command so that it isn't interpreted as prend"
    #   autoSpacing: 'normal normal'
    #   multiPhraseAutoSpacing: 'normal normal'
    #   action: (input) ->
    #     @string 'print'
    'double-under':
      spoken: 'double under'
      grammarType: 'textCapture'
      description: '__snake_text__'
      tags: ['text', 'recommended']
      spaceBefore: true
      autoSpacing: (input) ->
        if input then 'normal normal'
      multiPhraseAutoSpacing: (input) ->
        if input then 'normal normal'
      action: (input) ->
        if input
          if input[0] == 'in' and input[1] == 'it'
            input = ['init']
          @string '__' + Transforms.snake(input) + '__'
    'private-snake':
      spoken: 'private snake'
      grammarType: 'textCapture'
      description: '_snake_text'
      tags: ['text', 'recommended']
      spaceBefore: true
      autoSpacing: (input) ->
        if input then 'normal normal'
      multiPhraseAutoSpacing: (input) ->
        if input then 'normal normal'
      action: (input) ->
        if input
          @string '_ackages' + Transforms.snake(input)

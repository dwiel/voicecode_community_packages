pack = Packages.register
  name: "atom custom"
  applications: ['com.github.atom']

# avoid inserting text via atom api, just send keystrokes
# this prevents the problem where text doesn't always get sent to modal windows
# Packages.await 'atom', ->
#   Packages.await 'darwin', ->
#     darwin = Packages.get 'darwin'
#     delete Commands.get('os:string').implementations['os:string@atom:atom:editor']
#     pack.implement
#       'os:string': (input) ->
#         if @getSelectedText()
#           @key 'delete'
#         darwin._string input

pack.commands
  enabled: true
,
  'reformat':
    spoken: 'reformat'
    action: (input) ->
      @key 'f', 'control option'
  "advanced-open-file":
    spoken: "advanced open file"
    description: "advanced open file atom plug-in"
    action: (input) ->
      @key 'o', 'command option'
  "cursor-next":
    spoken: "cursor next"
    description: "move cursor to next position"
    action: (input) ->
      @key '_', 'option'
  "cursor-previous":
    spoken: "cursor prev"
    description: "move cursor to previous position"
    action: (input) ->
      @key '-', 'option'
  "fold-all":
    spoken: "fold all"
    description: "fold all"
    action: (input) ->
      @key '{', 'command option'
  "unfold-all":
    spoken: "unfold all"
    description: "unfold all"
    action: (input) ->
      @key '}', 'command option'
  'search-project':
    spoken: 'marcall'
    description: 'search the entire project'
    action: ->
      @key  'f', 'command shift'
  'reflow-selection':
    spoken: 'reflow selection'
    description: 'reflow selected text'
    action: ->
      @key 'q', 'command option'
  'command-pallete':
    spoken: 'command palette'
    description: 'display the atom command pallete'
    action: ->
      @key 'p', 'command shift'
  'next-diff':
    spoken: 'next diff'
    description: 'move to next git diff'
    action: ->
      @key 'p', 'command shift'
      @delay 300
      @string 'git diff next'
      @key 'enter'
  'prev-diff':
    spoken: 'prev diff'
    description: 'move to next git diff'
    action: ->
      @key 'p', 'command shift'
      @delay 300
      @string 'git diff prev'
      @key 'enter'
  'toggle-git-pane':
    spoken: 'toggle jet'
    description: 'toggle the github pane'
    action: ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'github:toggle-git-tab'},
      true
  'find-and-replace:find-all':
    spoken: 'find and replace all'
    description: 'find and replace all'
    action: ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'find-and-replace:find-all'},
      true
  'marcall':
    spoken: 'mark all'
    action: ->
      @key 'f', 'command shift'
  'cell-pair':
    spoken: 'cell pair'
    description: 'select parent in ast'
    enabled: true
    action: ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'py-ast-edit:select-parent'},
      true
  'cell-this':
    spoken: 'cell this'
    description: 'select this in ast'
    enabled: true
    action: ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'py-ast-edit:select-this'},
      true
  'rope-in-line':
    spoken: 'rope in line'
    description: 'in line the current variable, argument or function'
    action: ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'py-ast-edit:rope-inline'},
      true
  'rope-extract-method':
    spoken: 'rope extract method'
    description: 'extract method from the current selection'
    action: ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'py-ast-edit:rope-extract-method'},
      true
  'rope-rename':
    spoken: 'rope rename'
    description: 'rename the current variable'
    action: ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'py-ast-edit:rope-rename'},
      true
  'go-to-definition':
    spoken: 'go to definition'
    description: 'go to the definition of the symbol under the cursor'
    action: ->
      @key 'g', 'command option'
  'remove-matching-brackets':
    spoken: 'snip brack'
    description: 'remove matching brackets'
    action: ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'bracket-matcher:remove-matching-brackets'},
      true
  'move-to-matching-brackets':
    spoken: 'go match'
    description: 'move cursor to matching bracket'
    action: ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'bracket-matcher:go-to-matching-bracket'},
      true
  'preview-markdown':
    spoken: 'preview markdown'
    description: 'display rendering of markdown content'
    action: ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'markdown-preview:toggle'},
      true
  "cut line":
    spoken: "cut line"
    description: "cut line"
    grammarType: 'integerCapture'
    action: (input) ->
      if input?
        @runAtomCommand 'goToLine', input, true
      @do 'clipboard:cut'
  "paste line":
    spoken: "paste line"
    description: "paste line {line_number}"
    grammarType: 'integerCapture'
    action: (input) ->
      if input?
        @runAtomCommand 'goToLine', input, true
      @do 'cursor:way-left'
      @do 'clipboard:paste'
  "organize imports":
    spoken: "organize imports"
    description: "organize python imports. requires package: python-isort"
    action: () ->
      @runAtomCommand 'trigger',
      {selector: 'atom-text-editor.is-focused', command: 'python-isort:sortImports'},
      true
  "pain n":
    spoken: "pain"
    description: "move to pain n"
    grammarType: 'integerCapture'
    action: (input) ->
      if input?
        for i in [0..10] by 1
          @key 'k', 'command'
          @key 'left', 'command'

        # if input is 1, we don't want to move right any
        for i in [2..input] by 1
          @key 'k', 'command'
          @key 'right', 'command'

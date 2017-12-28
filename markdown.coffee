pack = Packages.register
  name: 'atom markdown'
  description: 'markdown commands'
  applications: ['com.github.atom']

# Scope.register
#   name: 'atom-markdown-file'
#   condition: ->
#     editor = _.find(@currentApplication().editors, {focused: true})
#     return false unless editor?
#     console.log editor.scopes
#     result = _.difference ['source.gfm'], editor.scopes
#     result.length isnt 1

pack.commands
  enabled: true
,
   "heading":
     spoken: 'heading'
     # scope: 'atom-markdown-file'
     grammarType: "textCapture"
     description: "Formats the following text as heading 1"
     tags: ["domain-specific", "md"]
     action: (input) ->
       if input
         @string "# #{input}"
         @enter()
       else
         @string "# "

   "subheading":
     spoken: 'subheading'
     # scope: 'atom-markdown-file'
     grammarType: "textCapture"
     description: "Formats the following text as heading 2"
     tags: ["domain-specific", "md"]
     action: (input) ->
       if input
         @string "## #{input}"
         @enter()
       else
         @string "## "

    "italic":
      spoken: 'italic'
      # scope: 'atom-markdown-file'
      grammarType: "textCapture"
      spaceBefore: true
      autoSpacing: 'normal normal'
      multiPhraseAutoSpacing: 'normal normal'
      description: "Formats the following text as italic"
      tags: ["domain-specific", "md"]
      action: (input) ->
        # todo: don't ignore input if text is selected
        if contents = @getSelectedText()
          input = contents
        if input
          @string "*#{input}*"

    "bold":
      spoken: 'bold'
      # scope: 'atom-markdown-file'
      grammarType: "textCapture"
      spaceBefore: true
      autoSpacing: 'normal normal'
      multiPhraseAutoSpacing: 'normal normal'
      description: "Formats the following text as bold"
      tags: ["domain-specific", "md"]
      action: (input) ->
        # todo: don't ignore input if text is selected
        if contents = @getSelectedText()
          input = contents
        if input
          @string "**#{input}**"

    "strike":
      spoken: 'strike'
      # scope: 'atom-markdown-file'
      grammarType: "textCapture"
      spaceBefore: true
      autoSpacing: 'normal normal'
      multiPhraseAutoSpacing: 'normal normal'
      description: "Formats the following text as strike through"
      tags: ["domain-specific", "md"]
      action: (input) ->
        # todo: don't ignore input if text is selected
        if contents = @getSelectedText()
          input = contents
        if input
          @string "~~#{input}~~"

    # "hrule":
    #   spoken: ''
    #   description: "Insert a horizontal rule"
    #   tags: ["domain-specific", "md"]
    #   action: (input) ->
    #     @string "---"
    #     @enter()

    "bullet":
      spoken: 'bullet'
      # scope: 'atom-markdown-file'
      grammarType: "textCapture"
      description: "Formats the following text as bullet"
      tags: ["domain-specific", "md"]
      action: (input) ->
        if input
          @string "* #{input}"
        else
          @string "* "

    "list":
      spoken: 'listie'
      # scope: 'atom-markdown-file'
      grammarType: "textCapture"
      description: "Formats the following number as numbered list"
      tags: ["domain-specific", "md"]
      action: (input) ->
        if input
          @string "#{input}. "

# # Heading
#
# ## Sub-heading
#
# ### Another deeper heading
#
# Paragraphs are separated
# by a blank line.
#
# Two spaces at the end of a line leave a
# line break.
#
# Text attributes _italic_, *italic*, __bold__, **bold**, `monospace`.
#
# Horizontal rule:
#
# ---
#
# Bullet list:
#
#   * apples
#   * oranges
#   * pears
#
# Numbered list:
#
#   1. apples
#   2. oranges
#   3. pears
#
# A [link](http://example.com).

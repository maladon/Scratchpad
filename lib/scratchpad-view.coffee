{$, View, Range} = require 'atom'

module.exports =
class ScratchpadView extends View
  @content: ->
    rows = atom.config.get "scratchpad.rows"
    rows = 30 if not rows?

    opacity = atom.config.get "scratchpad.opacity"
    opacity = 1 if not opacity?

    @div id: 'scratchpadContainer', class: 'scratchpad overlay from-top', style: "opacity: #{opacity}", =>
      @textarea outlet: 'padContent', class: 'native-key-bindings', rows: rows

  constructor: (content) ->
    super
    if content
      @padContent.val(content.padContent)

  initialize: (serializeState) ->
    atom.workspaceView.command "scratchpad:toggle", => @toggle()

  serialize: ->
    {
      padContent: @padContent.val(),
      deserialize: @constructor.name
    }

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    if @hasParent()
      @editor.focus()
      @detach()
    else
      @editor = atom.workspaceView.find('.editor.is-focused')
      atom.workspaceView.append(this)
      @padContent.focus()

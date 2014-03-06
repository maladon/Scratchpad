{View} = require 'atom'

module.exports =
class ScratchpadView extends View
  @content: ->
    rows = atom.config.get "scratchpad.rows"
    rows = 30 if not rows?

    @div id: 'scratchpadContainer', class: 'scratchpad overlay from-top', =>
      @textarea outlet: 'padContent', class: 'native-key-bindings', rows: rows

  constructor: (content) ->
    super
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
      @detach()
    else
      atom.workspaceView.append(this)

{$, View, Range} = require 'atom-space-pen-views'
{Range, CompositeDisposable} = require 'atom'

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
    @workspace = $('atom-workspace')
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', "scratchpad:toggle", => @toggle()

  serialize: ->
    {
      padContent: @padContent.val(),
      deserialize: @constructor.name
    }

  # Tear down any state and detach
  destroy: ->
    @subscriptions?.dispose()
    @detach()

  toggle: ->
    if @hasParent()
      @workspace.focus()
      @detach()
    else
      @workspace.append(this)
      @padContent.focus()

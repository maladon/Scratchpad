ScratchpadView = require './scratchpad-view'

module.exports =
  scratchpadView: null

  activate: (state) ->
    @scratchpadView = new ScratchpadView(state.scratchpadViewState)

  deactivate: ->
    @scratchpadView.destroy()

  serialize: ->
    scratchpadViewState: @scratchpadView.serialize()

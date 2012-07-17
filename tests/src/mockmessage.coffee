# Extends the message class and overrides the socket emission points.
Message = require 'nodesole/server/src/message'

class MockMessage extends Message

  constructor: (@socket, @event, @data) ->
    @sent = {}
    @broadcast = {}

  send: (packet, event) ->
    sendEvent = event || @event
    @sent[sendEvent] = @sent[sendEvent] || []
    @sent[sendEvent].push packet
    @handled = true

  broadcast: (packet, event) ->
    sendEvent = event || @event
    @broadcast[sendEvent] = @sent[sendEvent] || []
    @broadcast[sendEvent].push packet
    @handled = true

  sendAll: (packet, event) ->
    @.send(packet, event)
    @.broadcast(packet, event)

module.exports = MockMessage

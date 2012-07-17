Command = require 'nodesole/server/src/command'
Message = require '../src/mockmessage'

command = new Command()
require('../../scripts/tshock.coffee')(command)

describe 'Tshock Script Test', ->
  it 'Printing tshock help', ->
    message = new Message(null, 'command-request', { command: 'tshock help' })
    command.trigger 'command-request', message

    helpText = "Tshock server command list:\n\ttshock help - This help screen.\n\ttshock info - Gets number of players listed.\n"
    expect(message.sent['command-request'][0].message).toEqual helpText

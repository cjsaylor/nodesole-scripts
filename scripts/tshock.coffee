#
# Configuration:
#   tshock.json:
#     host - full path to tshock api endpoint
#     port - host endpoint port
http = require 'http'
config = require __dirname + '/tshock.json';

module.exports = (command) ->

  command.addHelpString '\ttshock help - Get info from a tshock terraria server.'

  command.register 'command-request', (message) ->
    if /^tshock help$/i.test message.data.command
      helpText = "Tshock server command list:\n"
      helpText+= "\ttshock help - This help screen.\n"
      helpText+= "\ttshock info - Gets number of players listed.\n"
      message.send(message.createMessageText helpText)

    if /^tshock info$/i.test message.data.command
      message.send(message.createMessageText 'Requesting...', 'info')
      options =
        host: config.host
        port: config.port
        path: '/status'
        method: 'get'
      http.request options, (res) ->
        output = ''
        res.on 'data', (chunk) ->
          output += chunk
        res.on 'end', ->
          data = JSON.parse output
          response = '\tNumber of players: ' + data.playercount + '\n'
          response+= '\tPlayers: ' + JSON.stringify(data.players) + '\n'
          message.send(message.createMessageText response)
      .on 'error', (e) ->
        message.send(message.createMessageText e.message, 'error')
      .end()

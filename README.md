Nodesole Scripts is a central repo for all public [Nodesole](https://github.com/cjsaylor/nodesole) extension scripts.

## Installing scripts

Simply copy your script into the `server/scripts` directory and restart nodesole.

Note: it must implement the callback structure specified below.

## Commander

Each script is passed the [Command](https://github.com/cjsaylor/nodesole/blob/master/server/src/command.coffee) object that allows registration of events.

To register, simply call the register method of the command object passing the event string you want (specified below) and a callback method.

## Available Events

* `command-request` - Called when a user submits a command through the console to the server.
* `chat-request` - Called when a user submits a chat message.
* `disconnect` - Called when a user disconnects from the server.

## Constructing the callback

A registered callback will always be passed a [Message](https://github.com/cjsaylor/nodesole/blob/master/server/src/message.coffee) object
that allows access to the current event information and for sending and broadcasting messages to connected clients.

A typical command registration callback will look similar to this:

```coffeescript
module.exports = (command) ->
  command.register 'command-request', (message) ->
    ...
```

## API

### Command

* `register(event, callback)` - Registers and event callback method
* `addHelpString(string)` - Adds a string to the "help" message displayed when users type "help".  Typically, these begin with a `\t` char.
* `getConfig(script, key)` - Gets a configuration based on a script and key value.
* `setConfig(script, key, value)` - Sets a configuration value based on script and key.

### Message

* `send(packet, event)` - Send a message back to a single user.  `packet` is an object containing `message` and `type`.  `event` is for overriding.
* `broadcast(packet, event)` - Send a message back to all users but requesting user.
* `sendAll(packet, event)` - Send a message to all users.
* `createMessageText(message, type)` - Useful utility method for contructing the message object.

## Acknowledgments

The concept and structure of the "plugin" script architecture is inspired by Github's [Hubot](http://hubot.github.com/)

## License

(The MIT License)

Copyright (c) 2012 Chris Saylor cjsaylor@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


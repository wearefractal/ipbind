{Agent} = require 'http'
{Socket, _createServerHandle} = require 'net'
class BindAgent extends Agent
  constructor: (options) ->
  createConnection: (port, host, options) ->
    throw 'bind missing' if !options or !options.bind
    socket = new Socket handle: _createServerHandle options.bind
    socket.connect port, host
    return socket

module.exports = BindAgent

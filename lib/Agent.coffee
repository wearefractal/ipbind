{Agent} = require 'http'
{Socket, _createServerHandle} = require 'net'
  
class BindAgent extends Agent
  constructor: (bind) ->
    super bind
    @createConnection = (port, host) ->
      throw 'bind missing' unless bind?
      socket = new Socket handle: _createServerHandle bind
      return socket.connect port, host

module.exports = BindAgent

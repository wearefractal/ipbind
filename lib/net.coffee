net = require 'net'

module.exports =
  createConnection: (port, host, bind, cb) ->
    throw 'bind missing' unless bind?
    socket = new net.Socket handle: net._createServerHandle bind
    return socket.connect port, host, cb

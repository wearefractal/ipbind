{Agent} = require 'http'
net = require './net'
  
class BindAgent extends Agent
  constructor: (bind) ->
    super bind
    @createConnection = (port, host) -> 
      net.createConnection port, host, bind

module.exports = BindAgent

http = require 'http'
{Agent} = require '../index'
log = require 'node-log'
log.setName 'ipbind-test'

options =
  agent: new Agent '192.168.1.101'
  host: 'checkip.dyndns.org'
  port: 80

http.get options, (res) ->
  res.setEncoding "utf8"
  body = ''
  res.on 'data', (chunk) -> body += chunk
  res.on 'end', -> log.debug body

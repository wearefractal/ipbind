http = require 'http'
{Agent, net} = require '../index'
log = require 'node-log'
log.setName 'ipbind-test'

outbound = '192.168.1.101'

# HTTP Test
options =
  agent: new Agent outbound
  host: 'checkip.dyndns.org'
  port: 80

http.get options, (res) ->
  res.setEncoding "utf8"
  body = ''
  res.on 'data', (chunk) -> body += chunk
  res.on 'end', -> log.debug "HTTP: #{body}"
  
# Raw net test
conn = net.createConnection 80, 'checkip.dyndns.org', outbound, -> log.info 'Connected!'

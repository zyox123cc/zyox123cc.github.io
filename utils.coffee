###
some handy coffeescript functions

@author heimark
###

# String Stripping
String::strip = ->  @replace   /^\s|\s+$/g, ''
String::lstrip = -> @replace  /^\s+/g, ''
String::rstrip = -> @replace  /\s+$/g, ''

# File Reading by line
fs = require 'fs'
eachLineIn = (filePath, func) ->

  blockSize = 4096
  buffer = new Buffer(blockSize)
  fd = fs.openSync filePath, 'r'
  lastLine = ''

  callback = (err, bytesRead) ->
    throw err if err
    if bytesRead is blockSize
      fs.read fd, buffer, 0, blockSize, null, callback

    lines = buffer.toString('utf8', 0, bytesRead).split '\n'
    lines[0] = lastLine + lines[0]
    [completeLines..., lastLine] = lines
    func(line) for line in completeLines
    return

  fs.read fd, buffer, 0, blockSize, 0, callback
  return

exports.eachLineIn = eachLineIn
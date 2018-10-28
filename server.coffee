http = require("http")
router = require("./router")

### Starts the node server, logs port to console ###
start = ->
  onRequest = (request, response) ->
    request.setEncoding "utf8"
    router.route request, response
  port = process.env.PORT or 3000
  http.createServer(onRequest).listen port
  console.log "Opened the pod bay doors on port " + port + "..."
start()
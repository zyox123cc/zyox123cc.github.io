url = require("url")
poptags = require("./poptags")

route = (request, response) ->
  tagmap = poptags.tagmap
  query = url.parse(request.url).query
  console.log("request: #{request.url}")
  unless query
    tagmap['poptaghome'] null, response
  else
    splitquery = query.split("%20")
    key = splitquery.shift()
    params = splitquery
    if typeof tagmap[key] is "function"
      tagmap[key] params, response
    else
      splitquery = url.parse(request.url).splitquery
      console.log "unable to find key: '" + key + "' defaulting to google with: " + query
      response.writeHead 302,
        Location: "https://www.google.com/search?q=" + query

      response.end()
exports.route = route
###
Requires/Libraries that you want to load should be stuck here
###
utils = require('./utils')

###
(Pseudo-)constant variables that are useful to have
Use all caps just to make this easier on the rest of us :)
###

###
Functions that are used in the tagmap.

Tagmap functions will be passed two arguments:
  @params   is an array of the querystring, broken into words
  @response is the response object. ** remember to response.end()!!

Let's try and keep these in alphabetical order if possible

Add single-line summaries above each function with three octothorps (#) on either side.
Will use these later to build a pretty printed list.
###

tagmap =
  ### pulls up the site for the best football team ever ###
  chels:(params, response)->
    response.writeHead 302,
      Location: "http://www.guardian.co.uk/football/chelsea"
    response.end()

  ### executes a google search for the parameters ###
  g:(params, response)->
    response.writeHead 302,
      Location: "https://www.google.com/search?q=#{params.join("%20")}"
    response.end()

  ### shows a list of the PopTag functions (this page) ###
  poptags:(params, response) ->
    comment_filter = ///
      \#{3}   # three octothorpes to begin
      (.*)    # any number of any character -- capture this
      \#{3}$  # line ends with three octothorpes
      ///
    function_name_filter = ///
      (\w+)    # a word
      \:       # followed by a colon
      ///
    is_a_comment = null
    prev_line_comment = null
    write_functions = (response)->
      response.writeHead(200, 'text/html')
      response.write("<html><body>
      <h1>Bookmarklets</h1>")
      response.write("<table>")
      utils.eachLineIn 'poptags.coffee', (line)->
        is_a_comment = line.match(comment_filter)
        if is_a_comment
          prev_line_comment = is_a_comment[1].strip()
        else if prev_line_comment
          is_a_function = line.match(function_name_filter)
          if is_a_function
           func = is_a_function[1].strip()
           response.write("<tr><td><b>#{func}</b></td><td><p>#{prev_line_comment}</p></td>")
           prev_line_comment = null
        else if line.match /^exports.tagmap/
          response.write("</table></body></html>")
          response.end()
        else
          prev_line_comment = null
    write_functions(response)

  ### shows the poptag home page ###
  poptaghome:(params, response)->
    response.writeHead 200, "text/html"
    response.write "<html><body>"
    response.write "<h1>PopTag</h1>"
    response.write "<h4>Does one thing.</h4>"
    response.write "<h2>Socializes bookmarklets</h2>"
    response.write "<h4>Does it in coffeescript</h4>"
    response.write '<a href="/?poptags">bookmarklets</a>'
    response.write "</body></html>"
    response.end()

  ### like a rickroll, but muppet-style ###
  mproll:(params, response)->
    response.writeHead 302,
      Location: "http://www.youtube.com/watch?v=qxitX4UNkxo"
    response.end()

  ### good way to clean your eyes after a nasty page ###
  saveme:(params, response)->
    response.writeHead 302,
      Location: "http://kidbleach.com/"
    response.end()

  ### searches youtube ###
  yt:(params, response)->
    response.writeHead 302,
      Location: "http://www.youtube.com/results?search_query=" + params.join("%20")
    response.end()



exports.tagmap = tagmap

PopTag
======

Easy bookmarklets. In coffeescript, served by node.

Inspired by [yubnub](http://www.yubnub.org) and [bunny1](http://www.bunny1.org).

###Why?
Because node/javascript is a better fit than python or php for command-line style redirects (or "popping tags"). They should be asynchronous. Coffeescript becuase it's prettier and more approachable than javascript.

PopTag is a great way for someone new to node and/or coffeescript to get comfortable with a very simple server and router.

###*Questions? Comments?*
[heimark](http://www.heimark.org)

# Installation Instructions
There are two ways to use PopTag. Either stick with the default commands, or compile your own PopTag server.

## Using commands in your browser
You can use the (very basic) commands at poptag.heroku.com. Follow the instructions on the [bunny1 home page](http://www.bunny1), but use **poptag.heroku.com/?** instead of **bunny1.org/?**.

## Build Your Own
from your home directory (or wherever you would like to store the files)

    git clone git@github.com:jheimark/poptag.git; cd poptag

make sure you have [coffeescript](http://www.coffeescript.org/) and [node](http://www.nodejs.org/) installed. Then

    coffee server.coffee

You should see:

    Opened the pod bay doors on port XXXX....

Then navigate to:

    http://localhost:3000

and you will see the PopTag home page.

# Release Notes
### version 0.0.1
* basic infrastructure built, a few simple commands implemented
* full source contains everything necessary to run on heroku immediately
* falls back to Google search

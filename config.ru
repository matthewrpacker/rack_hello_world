# Hello, World! variations:
# run ->(env) {[200, {'Content-Type' => 'text/html'}, ["Hello, World!"]]}
# run -> e {[200, {'Content-Type' => 'text/html'}, ["Hello, World!"]]}
# run -> e { Rack::Response.new("Hello, World!") }

# view = <<-HTML
# <!DOCTYPE html>
# <html>
# <head>
#   <meta charset="utf-8">
#   <title>Rack with HTML</title>
# </head>
# <body>
#   <div>
#     <h1>Hello World!</h1>
#   </div>
# </body>
# </html>
# HTML
#
# run -> e { Rack::Response.new(view) }

require 'erb'

view = <<-HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Rack with ERB</title>
  <style>
  h1   {
    color: blue;
    text-align: center;
  }
  button    {
    background-color: midnightblue;
    color: white;
  }
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
  <div>
    <button id="show-time">Current Time</button>
    <button id="hide-time">Hide Current Time</button>
    <h1 class="current-time">Current time: <%= Time.now %></h1>
  </div>
  <script>
  $(function () {
    hideAll()
    $("#show-time").show()

    function hideAll() {
      $(".current-time").hide()
      $("#show-time").hide()
      $("#hide-time").hide()
    }

    $("#show-time").on("click", function (event) {
      event.preventDefault();
      hideAll()
      $(".current-time").show()
      $("#hide-time").show()
    })

    $("#hide-time").on("click", function (event) {
      event.preventDefault();
      hideAll()
      $("#show-time").show()
    })
  })
  </script>
</body>
</html>
HTML

run -> e { Rack::Response.new(ERB.new(view).result) }

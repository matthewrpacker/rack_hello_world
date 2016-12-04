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
</head>
<body>
  <div>
    <h1>Current time: <%= Time.now %></h1>
  </div>
</body>
</html>
HTML

run -> e { Rack::Response.new(ERB.new(view).result) }

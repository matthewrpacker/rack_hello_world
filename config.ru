# Hello, World! variations:
# run ->(env) {[200, {'Content-Type' => 'text/html'}, ["Hello, World!"]]}
# run -> e {[200, {'Content-Type' => 'text/html'}, ["Hello, World!"]]}
run -> e { Rack::Response.new("Hello, World!") }

require 'rack'

app = proc do |env|
  [
    200,
    { 'Content-Type' => 'text/plain' },
    ["Welcome aboard!\n"]
  ]
end

Rack::Handler::WEBrick.run app

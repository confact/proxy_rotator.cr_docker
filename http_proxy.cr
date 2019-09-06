require "proxy_rotator"
require "option_parser"

host = "0.0.0.0"
port = 3199

OptionParser.parse! do |opts|
  opts.on("-h HOST", "--host HOST", "define host to run server") do |opt|
    host = opt
  end

  opts.on("-p PORT", "--port PORT", "define port to run server") do |opt|
    port = opt.to_i
  end
end

username = ENV["PROXY_USERNAME"] || "user"
password = ENV["PROXY_PASSWORD"] || "pass"

server = Proxy::Rotator::Server.new(host, port, handlers: [
  HTTP::LogHandler.new,
  Proxy::Rotator::BasicAuth.new(username, password)
])

address = server.bind_tcp host, port
puts "Listening on http://#{address}"
puts "Use #{username}:#{password} for authentication"
server.listen

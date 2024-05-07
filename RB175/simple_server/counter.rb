# rubocop:disable all
require "socket"

server = TCPServer.new("localhost", 3003)

def parse_request(request_line)
  http_method, full_path, version = request_line.split
  path, unparsed_params = full_path.split('?')
  params = (unparsed_params || "").split('&').each_with_object({}) do |pair, hsh|
    key, value = pair.split('=')
    hsh[key] = value
  end
  
  [http_method, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  next unless request_line
  next if !request_line || request_line =~ /favicon/
  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i
  client.puts "<p>The current number is #{number}</p>"
  client.puts "<a href='http://localhost:3003/?number=#{number + 1}'>Add one</a>"
  client.puts "<p></p>"
  client.puts "<a href='http://localhost:3003/?number=#{number - 1}'>Subtract one</a>"

  client.puts "</body>"
  client.puts "</html>"

  client.close
end

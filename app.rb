require_relative 'lib/node'
require_relative 'lib/trie'
require_relative 'lib/result'
require_relative 'routes_reader'
require_relative 'players_controller'

class App
  def initialize
    @reader = RoutesReader.new
    @trie = Trie.new
    @trie.add_route(@reader.route)
  end

  def call(env)
     route = parse_request(env)
     route.name.empty? ? default_responce : form_response(route)
  end

  def parse_request(env)
    @trie.parse(env['REQUEST_PATH'])
  end

  def default_responce
    status = 404
    headers= {"Content-Type" => 'text/plain', "Content-Length" => '13'}
    body = ['404 Not Found']
    response status, headers, body
  end

  def form_response(route)
    value = find_controller_and_action route
    response 200,{"Content-Type" => 'text/plain'}, value
  end

  def find_controller_and_action(route)
    names = route.name.split('#')
    controller_name = names[0]
    action = names[1]
    class_name = "#{controller_name.capitalize}"+"Controller"
    if Kernel.const_defined?(class_name)
      controller = Object.const_get(class_name)
      if controller.instance_methods.include?(action.to_sym)
        controller.new.method(action).call(route.params)
      else
        ['Controller action doesnt exits']
      end
    else
      ['Controller  doesnt exits']
    end
  end

  def response(status,headers, body)
    status = status
    headers = headers
    body = body
    [status, headers, body]
  end
end
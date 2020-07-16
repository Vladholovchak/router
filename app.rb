require_relative 'lib/node'
require_relative 'lib/trie'
require_relative 'lib/result'
require_relative 'routes_reader'
require_relative 'players_controller'
require_relative 'items_controller'

class App
  def initialize
    @reader = RoutesReader.new
    @trie = Trie.new
    @trie.add_route(@reader.route)
  end

  def call(env)
     route = parse_request(env)
     route.name.empty? ? default_response : form_response(route)
  end

  def parse_request(env)
    @trie.parse(env['REQUEST_METHOD'] + env['REQUEST_PATH'])
  end

  def default_response
    status = 404
    headers= {"Content-Type" => 'text/plain', "Content-Length" => '13'}
    body = ['404 Not Found']
    [status, headers, body]
  end

  def form_response(route)
    value = find_controller_and_action route
     [200,{"Content-Type" => 'text/plain'}, value]
  end

  def find_controller_and_action(route)
    controller_name, action = route.name.split('#')
    class_name = "#{controller_name.capitalize}Controller"
    controller = Object.const_get(class_name)
    if controller.instance_methods.include?(action.to_sym)
      controller.new.method(action).call(route.params)
    else
      ['Controller action doesnt exits']
    end
  rescue NameError
    ['Controller  doesnt exits']
  end
end
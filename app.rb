require_relative 'lib/node'
require_relative 'lib/trie'
require_relative 'lib/result'
require_relative 'routes_reader'
require_relative 'controller'

class App
  def initialize
    @reader = RoutesReader.new
    @trie = Trie.new
    @trie.add_route(@reader.route)
  end

  def call(env)
    status = 200
    headers = {"Content-Type" => "text/html"}
    body = ['My app']
    case env['REQUEST_PATH']
    when '/'
      [status, headers,body]
    else
      action = @trie.parse(env['REQUEST_PATH'])
      if Controller.method_defined?(action.name)
        body = Controller.new.method(action.name).call(action.params)
      else
        status = '404'
        headers = {"Content-Type" => 'text/plain', "Content-Length" => '13'}
        body = ['404 Not Found']
      end
      [status, headers,body]
    end
  end
end
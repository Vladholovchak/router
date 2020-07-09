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
      body = Controller.new.method(action.name).call(action.params) if Controller.method_defined?(action.name)
      [status, headers,body]
    end
    # case env['REQUEST_PATH']
    # when '/'
    #   [status, headers,body]
    # when '/about/'
    #    action = @trie.parse('/about/')
    #    body = Controller.new.method(action.name).call(action.params)
    #   [status, headers, body]
    # when  '/player'
    #
    #   [status, headers, ['player']]
    # else
    #   [   '404',
    #       {"Content-Type" => 'text/plain', "Content-Length" => '13'},
    #       ["404 Not Found"]
    #   ]
    # end
  end
end
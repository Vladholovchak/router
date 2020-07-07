require_relative 'lib/node'
require_relative 'lib/trie'
require_relative 'lib/result'
require_relative 'routes_reader'
require_relative 'controller'

reader = RoutesReader.new
reader.read_route
trie = Trie.new
trie.add_route(reader.route)
action = trie.parse('/about/')

if action.ids.empty?
  Controller.new.method(action.name).call
else
  Controller.new.method(action.name).call(action.ids)
end
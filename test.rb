require_relative 'node'
require_relative 'tree'

trie = Trie.new

trie.add_route(name: 'match', route: 'match')
trie.add_route(name: 'player', route: 'player/:id')
trie.add_route(name: 'player_more', route: 'player/:id/more')

p trie

require_relative 'node'
require_relative 'tree'

trie = Trie.new

trie.add_route('match': 'match')
trie.add_route('player': 'player/:id')
trie.add_route('player_more': 'player/:id/more/:id')

p trie

require_relative 'node'
require_relative 'trie'

trie = Trie.new

trie.add_route({
               'match': 'match/',
               'player': 'player/:id',
               # 'player_more': 'player/:id/more/:id'
               })

trie

p trie.parse('match/')
p trie.parse('player/:id')

require_relative 'node'
require_relative 'tree'

trie = Trie.new

trie.add_route({
                   'match': 'match',
               'player': 'player/:id',
               'player_more': 'player/:id/more/:id'
               })

p trie

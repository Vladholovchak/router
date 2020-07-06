require_relative 'node'
require_relative 'trie'

trie = Trie.new

trie.add_route({
               'match': 'match/',
               'player': 'player/:id/',
               'player_info': 'player/:id/:id'
               })

p trie.parse('/user/')

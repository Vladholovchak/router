require_relative '../lib/node'
require_relative '../lib/trie'
require_relative '../lib/result'

trie = Trie.new

trie.add_route({
               'match': '/about/',
               'player_id': '/player/:id/'
               })

trie.parse('/about/')
trie.parse('/player/2')
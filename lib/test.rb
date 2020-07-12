require_relative '../lib/node'
require_relative '../lib/trie'
require_relative '../lib/result'

trie = Trie.new

 trie.add_route( player_id: '/player/:id', match: '/match')


 p trie.parse('match')
 p trie.parse('user/5/')
 p trie.parse('player/5')
require_relative '../lib/node'
require_relative '../lib/trie'
require_relative '../lib/result'

trie = Trie.new

 trie.add_route( {'players#index': '/players/all',
                  'players#show': '/players/:id/info',
                  'items#index': '/items/all',
                  'items#show': '/items/:id/info'
                 })


 p trie.parse('/player/5')
 p trie.parse('/players/5/info')
 p trie.parse('/items/all')
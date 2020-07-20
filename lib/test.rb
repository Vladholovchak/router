# frozen_string_literal: true

require_relative '../lib/node'
require_relative '../lib/trie'
require_relative '../lib/result'

trie = Trie.new

 trie.add_route('players#index': 'GET/players/all',
                 'players#show': 'POST/players/:id/info',
                 'items#index': 'GET/items/all',
                 'items#show': 'POST/items/:id/info')

p trie.parse('GET/players/all')
p trie.parse('POST/players/5/info')
p trie.parse('GET/items/all')

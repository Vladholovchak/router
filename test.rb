require_relative 'node'
require_relative 'tree'

trie = Trie.new

#trie.add_route(name: 'match', route: 'match')
trie.add_route(name: 'player', route: 'player/5/6')
trie.add_route(name: 'user_info', route: 'user/4/info')

p trie

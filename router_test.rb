
# router.rb
require 'minitest/autorun'
require_relative 'node'
require_relative 'tree'

class RouterTest < Minitest::Test


  def setup
    @trie = Trie.new()
  end

  def test_match
    assert_equal({ match: {}}, @trie.parse("/match"))
  end

  def player
    assert_equal({player: {id: 1}}, @trie.parse("/player/1"))
  end

  def player_info
    assert_equal({player_info: {id: 2}}, @trie.parse("/player/2/info"))
  end

  def add_obj
    @trie.add(match: "/match")
    assert @trie.class == Trie
  end

  def add_route

  end

  def clean_route

  end

  def find_route

  end

end
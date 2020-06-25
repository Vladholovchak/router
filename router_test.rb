
# router.rb
require 'minitest/autorun'
require_relative 'node'
require_relative 'tree'

class RouterTest < Minitest::Test


  def setup
    @trie = Trie.new()
  end

  # def test_match
  #   assert_equal({ match: {}}, @trie.parse("/match"))
  # end
  #
  # def test_player
  #   assert_equal({player: {id: 1}}, @trie.parse("/player/1"))
  # end
  #
  # def test_player_info
  #   assert_equal({player_info: {id: 2}}, @trie.parse("/player/2/info"))
  # end

  def test_add_obj
    @trie.add_route(match: "/match")
    assert @trie.class == Trie
  end

  def add_route

  end

  def clean_route

  end

  def find_route

  end

end
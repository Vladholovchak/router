
require_relative '../node'
require_relative '../trie'
require_relative 'spec_helper'
require_relative '../result'

describe Trie do
  before :each do
    @trie = Trie.new
  end

  describe :add_route do

    it 'returns Node when add route in the trie' do
      @trie.add_route('match': '/match')
      @trie.root.class == Node
    end


    describe "node" do

      it "add child" do
        @root = Node.new('/')
        @node = Node.new('player', 'player')
        @root.send("add_child", @node, @root.next)
        expect(@root.next[0]).to be @node
      end

      it "is dynamic" do
        @trie.add_route('player':'/:id')
        expect(@trie.root.next[0].next[0].dynamic).to be true
      end
      it "is static" do
        @trie.add_route('player':'/player')
        expect(@trie.root.next[0].next[0].dynamic).to be false
      end
      it "has a name, when it end of route" do
        @trie.add_route('player':'/player/more')
        expect(@trie.root.next[0].next[0].next[0].name).to be :player
      end

      it "hasn't a name, when it not end of route" do
        @trie.add_route('player':'/player/more')
        expect(@trie.root.next[0].next[0].name).to be nil
      end
    end

    describe :create_child do
      it "add child to trie and its node" do
        @trie = Trie.new
        @trie.root.send("create_child", 'player_more', 'player', @trie.root.next)
        expect(@trie.root.next[0].class). to eq Node
      end
    end

    describe :add_part do

      it "call  add_child which creates new Node in parent Node" do
        @trie = Trie.new
        @trie.root.add_part('', 'player', @trie.root.next)
        (@trie.root.add_part('more', 'more', @trie.root.next[0].next))
        expect(@trie.root.next[0].value).to eq 'player' and expect(@trie.root.next[0].next[0].value).to eq 'more'
      end

      it "find same value and returns that Node" do
        @trie.root.add_part('more', 'more', @trie.root.next)
        @trie.root.add_part('more', 'more', @trie.root.next)
        expect(@trie.root.next[0].next[0]).to be nil
      end

    end

  end


  # it 'returns nil if route is nil'do
  #   @trie.add_route('player_more': '').to raise_error()
  # end
  #
  # it 'returns nil if key is nil'do
  #   @trie.add_route('': 'role/:id').to raise_error()
  # end
  #
  # it 'returns nil if  string'do
  #   @trie.add_route('role/:id').to raise_error(NoMethodError)
  # end


  # def test_add
  #   @trie.add_route('match': 'match')
  #   refute_empty @trie
  # end
  #
  # def test_trie_class
  #   @trie.add_route(match: "/match")
  #   assert @trie.class == Trie
  # end
  #


  describe do
    it 'find name of parsed route in Trie' do
      @trie.add_route('match': '/match')
      result = @trie.parse("/match")
      expect(result.name).to eq 'match'
    end
  end

  describe :parse do
    it 'return Result object' do
      @trie = Trie.new
      @trie.add_route('match': '/match')
      expect(@trie.parse("/match").class).to eq Result
    end

    it "return name and id when route exist" do
      @trie = Trie.new
      @trie.add_route('player_id': '/player/:id')
      res =@trie.parse('/player/5')
      expect(res.name).to eq 'player_id'
    end

    it "return empty Result object when route doesn't exist" do
      @trie = Trie.new
      @trie.add_route('user_info': '/user/:id')
      res = @trie.parse('/player/')   # if '/player/5' got exception
      p res
      expect(res.name).to eq ''
    end
  end
  #
  # def test_player
  #   assert_equal({player: {id: 1}}, @trie.parse("/player/1"))
  # end
  #
  # def test_player_info
  #   assert_equal({player_info: {id: 2}}, @trie.parse("/player/2/info"))
  # end
  #

end
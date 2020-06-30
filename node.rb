class Node
  attr_reader :value, :next, :dynamic, :name

  def initialize( value, name = '')
    @name = name
    @value = value
    @dynamic = dynamic?(value)
    @next = []
  end

  def dynamic?(value)
    value.chars[0] == ':' ? (@dynamic = true) : (@dynamic = false)
  end

  def add_part(name, part, trie)
    trie.find {|n| n.value == part} || add_child(name, part, trie)
  end

  def add_child(name, part, trie)
    child = Node.new(part, name)  # Node.new(part, name).tap {|new_node| trie << new_node }
    trie << child
    child
  end
end
class Trie

  def initialize
    @root = Node.new('/')
  end

  def add_route(hash)
    parts = hash[:route].split('/')
    base = @root
    name = ''
    parts.each do |part|
      name = hash[:name] if parts.last == part
      base = add_part(name, part, base.next)
    end
  end

  def add_part(name, part, trie)
    trie.find {|n| n.value == part} || add_node(name, part, trie)
  end

  def add_node(name, part, trie)
    dynamic = false
    dynamic = true if part.chars[0] == ':'
    Node.new(part, name, dynamic).tap { |new_node| trie << new_node}
  end

end

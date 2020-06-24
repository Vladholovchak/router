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

  def dynamic

  end

  def add_part(name, part, trie)
    trie.find { |n| n.value == part} || add_node(name, part, trie)
  end

  def add_node(name, part, trie)
    Node.new(part, name).tap { |new_node| trie << new_node}
  end

end

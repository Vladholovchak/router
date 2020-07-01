class Trie

  attr_reader :root

  def initialize
    @root = Node.new('/')
  end

  def add_route(hash)
    hash.keys.each do |k|
      parts = hash[k.to_sym].split('/')
      base = @root
      parts.each do |part|
        name = k if parts.last == part
        base = base.add_part(name, part, base.next)
      end
    end
  end

  def parse(route)
    parts = route.split('/')
    base    = @root
    parts.all? do |part|
      base = find_part(part, base.next)
    end
    base.name
  end

  def find_part(part, trie)
    trie.find { |n| n.value == part }
  end

end

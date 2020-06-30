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
end

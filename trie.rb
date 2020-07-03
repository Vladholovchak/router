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
    ids = []
    result = {'id': ids}
    parts.all? do |part|
      base, result = find_part(part,base.next,result)
    end
    # result
    final_result = {}
    final_result.store(result[:name], {'id': result[:id]})
    final_result
  end

  def find_part(part, base, result)
    base.each do |n|
      if n.dynamic
        result[:id] << part
        result[:name] = n.name
        return n, result
      elsif n.value == part
         result[:name] = n.name
        return n, result
      end
    end
  end
end

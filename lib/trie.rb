class Trie

  attr_reader :root

  def initialize
    @root = Node.new('/')
  end

  def add_route(hash)
    hash.keys.each do |k|
      parts = hash[k].split('/')
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
    parts.each do |part|
      base, result = find_part(part,base.next,result)
    end
    result_object(result)
  end

  private

  def find_part(part, base, result)
    base.each do |n|
      if n.dynamic?
        result[:'id'] << part
        result[:'name'] = n.name
        return n, result
      elsif n.value == part
         result[:'name'] = n.name
         return n, result
      end
    end
  end

  def result_object(result)
      return  Result.new if result.nil? or result.class == Node #
      Result.new(result[:name].to_s,result[:id])
  end
end

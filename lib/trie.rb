# frozen_string_literal: true

class Trie
  attr_reader :root

  def initialize
    @root = Node.new('')
  end

  def add_route(hash)
    hash.keys.each do |k|
      parts = form_parts hash[k]
      base = @root
      parts.each do |part|
        name = k if parts.last == part
        base = base.add_part(name, part, base.next)
      end
    end
  end

  def parse(route)
    parts = form_parts route
    base = @root
    params = []
    result = { params: params }
    parts.each do |part|
      base, result = find_part(part, base.next, result)
      result.class == Node ? result = nil : result
      break if base.nil? || result.nil?
    end
    result_object(result)
  end

  private

  def form_parts(route)
    parts = route.split('/')
    parts.delete('')
    parts
  end

  def find_part(part, base, result)
    base.each do |n|
      if n.dynamic? &&  result.class != Node
        result[:params] << part
        result[:name] = n.name
        return n, result
      elsif n.value == part
        result[:name] = n.name
        return n, result
      end
    end
  end

  def result_object(result)
    result.nil? ? Result.new : Result.new(result[:name].to_s, result[:params])
  end
end

class Node
  attr_reader :value, :next, :dynamic, :name

  def initialize( value, name = '')
    @name = name
    @value = value
    @dynamic = dynamic?
    @next = []
  end

  def dynamic?
    value.chars[0] == ':'
  end

  def add_part(name, part, parent)
    parent.find {|n| n.value == part} || create_child(name, part, parent)
  end

  private

  def create_child(name,part, parent)
    child = Node.new(part, name)
    add_child(child, parent)
    child
  end

  def add_child(child, parent)
    parent << child
  end
end
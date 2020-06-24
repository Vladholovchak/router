class Node
  attr_reader :value, :next
  attr_accessor :route

  def initialize( value, name = '', dynamic = false)
    @name = name
    @value = value
    @next = []
    @dynamic = dynamic
  end
end
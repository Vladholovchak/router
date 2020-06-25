class Node
  attr_reader :value, :next
  attr_accessor :dynamic

  def initialize( value, name = '', dynamic =false)
    @name = name
    @value = value
    @dynamic = dynamic
    @next = []
  end
end
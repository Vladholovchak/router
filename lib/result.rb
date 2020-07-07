class Result

  attr_reader :name, :ids

  def initialize(name = '', ids= '')
    @name = name
    @ids = ids
  end
end
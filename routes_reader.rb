require 'yaml'

class RoutesReader

  attr_reader :route

  def initialize
    @route = read_route
  end

  def read_route
     YAML.load_file('routes.yml')
  end


end
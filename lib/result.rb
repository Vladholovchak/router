# frozen_string_literal: true

class Result
  attr_reader :name, :params

  def initialize(name = '', params = '')
    @name = name
    @params = params
  end
end

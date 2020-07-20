require 'slim'
class BasicController

  private

  def render(name,model)
    Slim::Template.new("templates/#{name}.slim").render(model)
  end
end
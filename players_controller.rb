class PlayersController
  def index(params)
    ['players']
  end

  def show(params)
    ["player: #{params}"]
  end
end

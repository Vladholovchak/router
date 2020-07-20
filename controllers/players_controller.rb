# frozen_string_literal: true

class PlayersController < BasicController
  def index(params)
    @players = Model.new
    @players.name = %w[player_1 player_2 player_3]
    render('players', @players)
  end

  def show(params)
    "player: #{params}"
  end
end

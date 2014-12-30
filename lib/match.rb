require 'shot'

class Match
  attr_reader :player1
  attr_reader :player2
  attr_reader :shots

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @shots = []
  end

  def title
    "#{player1.name} vs #{player2.name}"
  end

  def play_shot
    @shots << Shot.new(0, 0, shots.empty?)
  end

  def last_shot
    shot.last
  end
end

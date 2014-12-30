class Shot
  attr_reader :reds
  attr_reader :yellows

  def initialize(reds = 0, yellows = 0, is_break = false, is_foul = false)
    @reds = reds
    @yellows = yellows
    @break = is_break
    @foul = is_foul
  end

  def break?
    @break
  end

  def foul?
    @foul
  end

  def dry?
    reds == 0 && yellows == 0
  end
end

class Bowling
  def initialize
    @scores = []
  end

  def total_score
    @total = @scores.sum
    while @scores.any?
      if strike_on_last_frame? || spare_on_last_frame?
        @scores.shift(3)
      elsif strike? && next_roll_strike?
        strike_and_next_roll_strike
      elsif strike?
        strike
      else
        @total += @scores[2] if spare?
        @scores.shift(2)
      end
    end
    @total
  end

  def roll(number_of_pins)
    @scores.push(number_of_pins)
  end

  private

  def spare?
    @scores[0] + @scores[1] == 10
  end

  def strike?
    @scores[0] == 10
  end

  def next_roll_strike?
    @scores[1] == 10
  end

  def spare_on_last_frame?
    @scores[0] + @scores[1] == 10 && @scores.count == 3
  end

  def strike_on_last_frame?
    @scores[0] == 10 && @scores.count == 3 || @scores[0] == 10 && @scores[1] == 10 && @scores.count == 2
  end

  def strike
    @total += @scores[1] + @scores[2]
    @scores.shift(3)
  end

  def strike_and_next_roll_strike
    @total += @scores[1]
    @scores.shift(1)
  end
end

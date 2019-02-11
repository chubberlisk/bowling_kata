class Bowling
  def initialize
    @scores = []
    @total = 0
  end

  def total_score
    while @scores.any?
      if strike?
        strike
      elsif spare?
        spare
      else
        sum
      end
    end
    @total
  end

  def roll(number_of_pins)
    @scores.push(number_of_pins)
  end

  private

  def spare?
    @scores[0..1].sum == 10
  end

  def strike?
    @scores[0] == 10
  end

  def spare_on_last_frame?
    @scores[0..1].sum == 10 && @scores.count == 3
  end

  def strike_on_last_frame?
    @scores[0] == 10 && @scores.count == 3 || @scores[0..1].all?(10) && @scores.count == 2
  end

  def strike
    @total += @scores[0] + @scores[1] + @scores[2] if @scores[1] < 10
    @total += @scores[0] + @scores[1] if @scores[1] == 10
    @scores.shift(strike_on_last_frame? ? 3:1)
  end

  def spare
    @total += @scores[0] + @scores[1] + @scores[2]
    @scores.shift(spare_on_last_frame? ? 3:2)
  end

  def sum
    @total += @scores[0] + @scores[1]
    @scores.shift(2)
  end
end

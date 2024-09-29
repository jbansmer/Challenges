class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new, "side lengths invalid" unless valid?
  end

  def kind
    if equilateral?
      'equilateral'
    elsif scalene?
      'scalene'
    else
      'isosceles'
    end
  end

  private

  def valid?
    @sides.all? { |side| side > 0 } &&
      @sides[0] + @sides[1] > @sides[2] &&
      @sides[0] + @sides[2] > @sides[1] &&
      @sides[1] + @sides[2] > @sides[0]
  end

  def equilateral?
    @sides.uniq.length == 1
  end

  def scalene?
    @sides.uniq.length == 3
  end
end

class Triangle
  attr_reader :sides
  
  def initialize(a, b, c)
    @sides = [a, b, c]
    raise ArgumentError.new 'Side lengths of zero not allowed' unless @sides.none? 0
    raise ArgumentError.new 'Invalid side lengths -- not a triangle!' unless valid?
  end

  def kind
    case sides.uniq.length
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  def valid?
    return false unless sides[0] + sides[1] > sides[2] &&
                    sides[1] + sides[2] > sides[0] &&
                    sides[2] + sides[0] > sides[1]
    true
  end
end

# triangle = Triangle.new(3, 3, 4)
# triangle2 = Triangle.new(5, 3, 4)
# triangle3 = Triangle.new(4, 4, 4)

# p triangle.kind
# p triangle2.kind
# p triangle3.kind
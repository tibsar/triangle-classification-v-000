class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    valid_triangle?()
    if @a == @b && @b == @c
      :equilateral
    elsif @a == @b || @b == @c || @a == @c
      :isosceles
    elsif @a != @b && @b != @c && @a != @c
      :scalene
    end
  end

  private
  def valid_triangle?
    # Make sure sides are not equal to 0
    if @a <= 0 || @b <= 0 || @c <= 0 || !triangle_equality
      raise TriangleError("This triangle isn't valid")
    end
  end

  def triangle_equality
    if (@a + @b <= @c) || (@b + @c <= @a) || (@a + @c <= @b)
      return false
    end
    return true
  end
end

class TriangleError < StandardError
  def initialize(message)
    
  end
  def message
    "The triangle sides provided do not form a valid triangle"
  end
end

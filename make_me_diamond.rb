class MakeMeDiamond

  attr_reader :stop_counter

  def initialize(stop)
    @stop_counter = stop.bytes[0] - 'A'.bytes[0]
    @base = '-------------------------------------'[(0..@stop_counter)]
  end

  def left_output(i)
    characters = String.new(@base)
    characters[i] = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'[i]
    return characters.reverse
  end

  def line(i)
    left_char = left_output(i)
    reflect(left_char)
  end

  def top_diamond
    (0..@stop_counter).collect { |i| self.line(i)}
  end
  
  def make_diamond
    top_part = top_diamond()
    reflect(top_part)
  end

  def reflect(array)
    array + array[(0...@stop_counter)].reverse
  end
end
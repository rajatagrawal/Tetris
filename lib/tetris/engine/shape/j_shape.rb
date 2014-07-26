require 'complex_shape'

module Tetris
  class J_Shape < ComplexShape
    def coordinates_for(orientation)
      case orientation
      when DEGREES_0
        [[@x, @y], [@x, @y+1], [@x+1, @y+1], [@x+2, @y+1]]
      when DEGREES_90
        [[@x+1, @y], [@x, @y], [@x, @y+1], [@x, @y+2]]
      when DEGREES_180
        [[@x+2, @y+1], [@x+2, @y], [@x+1, @y], [@x, @y]]
      when DEGREES_270
        [[@x, @y+2], [@x+1, @y+2], [@x+1, @y+1], [@x+1, @y]]
      end
    end
  end
end

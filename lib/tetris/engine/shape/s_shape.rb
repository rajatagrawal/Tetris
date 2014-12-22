require 'shape/complex_shape'

module Tetris
  class S_Shape < ComplexShape

    def coordinates_for(orientation)
      case orientation
      when DEGREES_0
        [[@x, @y+1], [@x+1, @y+1], [@x+1, @y], [@x+2, @y]]
      when DEGREES_90
        [[@x, @y], [@x, @y+1], [@x+1, @y+1], [@x+1, @y+2]]
      when DEGREES_180
        [[@x, @y+1], [@x+1, @y+1], [@x+1, @y], [@x+2, @y]]
      when DEGREES_270
        [[@x, @y], [@x, @y+1], [@x+1, @y+1], [@x+1, @y+2]]
      end
    end
  end
end

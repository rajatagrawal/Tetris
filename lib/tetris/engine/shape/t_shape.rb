require 'shape/complex_shape'

module Tetris
  class T_Shape < ComplexShape

    def coordinates_for(orientation)
      case orientation
      when DEGREES_0
        [[@x, @y+1], [@x+1, @y+1], [@x+1, @y], [@x+2, @y+1]]
      when DEGREES_90
        [[@x+1, @y], [@x+1, @y+1], [@x+1, @y+2], [@x+2, @y+1]]
      when DEGREES_180
        [[@x, @y+1], [@x+1, @y+1], [@x+2, @y+1], [@x+1, @y+2]]
      when DEGREES_270
        [[@x+1, @y], [@x+1, @y+1], [@x+1, @y+2], [@x, @y+1]]
      end
    end
  end
end

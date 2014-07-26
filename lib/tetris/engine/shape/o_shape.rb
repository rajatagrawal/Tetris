require 'complex_shape'

module Tetris
  class O_Shape < ComplexShape

    def coordinates_for(orientation)
      [[@x, @y], [@x+1, @y], [@x+1, @y+1], [@x, @y+1]]
    end
  end
end

require_relative 'complex_shape'
module Tetris
  class O_Shape < ComplexShape
    def rotated_coordinates(orientation)
      [@x, @y]
    end

    def rotated_block_coordinates(orientation)
      block_coordinates
    end

    private

    def initialize_blocks(color)
      @block_1 = Block.new(window, { x: x,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})

      @block_2 = Block.new(window, { x: x+1,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})

      @block_3 = Block.new(window, { x: x,
                                     y: y+1,
                                     unit_side: unit_side,
                                     color: color})


      @block_4 = Block.new(window, { x: x+1,
                                     y: y+1,
                                     unit_side: unit_side,
                                     color: color})
    end
  end
end

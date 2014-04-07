require_relative 'complex_shape'
module Tetris
  class T_Shape < ComplexShape

    private

    def initialize_blocks(color)
      @block_1 = Block.new(window, { x: x,
                                     y: y+1,
                                     unit_side: unit_side,
                                     color: color})

      @block_2 = Block.new(window, { x: x+1,
                                     y: y+1,
                                     unit_side: unit_side,
                                     color: color})

      @block_3 = Block.new(window, { x: x+1,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})


      @block_4 = Block.new(window, { x: x+2,
                                     y: y+1,
                                     unit_side: unit_side,
                                     color: color})
    end
  end
end

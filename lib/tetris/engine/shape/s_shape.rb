require_relative 'complex_shape'
module Tetris
  class S_Shape < ComplexShape

    def rotated_coordinates(orientation)
      if orientation == '90_degrees'
        [@x, @y - 1]
      elsif orientation == '180_degrees'
        [@x + 1, @y]
      elsif orientation == '270_degrees'
        [@x, @y + 2]
      elsif orientation == '0_degrees'
        [@x - 1, @y - 1]
      end
    end

    def rotated_block_coordinates(orientation)
      case orientation
      when '0_degrees'
        [[@x - 1, @y - 1], [@x, @y - 1],
         [@x, @y - 2], [@x + 1, @y - 2]]
      when '90_degrees'
        [[@x, @y - 1], [@x, @y],
         [@x + 1, @y], [@x + 1, @y + 1]]
      when '180_degrees'
        [[@x + 1, @y], [@x, @y],
         [@x, @y + 1], [@x - 1, @y + 1]]
      when '270_degrees'
        [[@x, @y + 2], [@x, @y + 1],
         [@x - 1, @y + 1], [@x - 1, @y]]
      end
    end

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
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})
    end
  end
end

require_relative 'complex_shape'
module Tetris
  class I_Shape < ComplexShape

    def rotated_coordinates(orientation)
      case orientation
      when '0_degrees'
        [@x - 2, @y + 2]
      when '90_degrees'
        [@x + 2, @y - 2]
      when '180_degrees'
        [@x - 2, @y + 2]
      when '270_degrees'
        [@x + 2, @y - 2]
      end
    end

    def rotated_block_coordinates(orientation)
      case orientation
      when '0_degrees'
        [[@x - 2, @y + 2],[@x - 1, @y + 2],[@x, @y + 2],[@x + 1, @y + 2]]
      when '90_degrees'
        [[@x + 2, @y - 2],[@x + 2, @y - 1],[@x + 2, @y],[@x + 2, @y + 1]]
      when '180_degrees'
        [[@x - 2, @y + 2],[@x - 1, @y + 2],[@x, @y + 2],[@x + 1, @y + 2]]
      when '270_degrees'
        [[@x + 2, @y - 2],[@x + 2, @y - 1],[@x + 2, @y],[@x + 2, @y + 1]]
      end
    end

    private

    def initialize_blocks(color)
      @block_1 = Block.new( { x: x,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})

      @block_2 = Block.new( { x: x+1,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})

      @block_3 = Block.new( { x: x+2,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})


      @block_4 = Block.new( { x: x+3,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})
    end
  end
end

require_relative 'shape'
require_relative 'block'
module Tetris
  class Z_Shape < Shape
    attr_accessor :block_1, :block_2
    attr_accessor :block_3, :block_4

    def initialize(window, config={})
      super
      initialize_blocks(config[:color])
    end

    def height
      2
    end

    def width
      3
    end

    def block_coordinates
      blocks.map do |block|
        [block.x, block.y, block.color]
      end
    end

    def draw
      blocks.each do |block|
        block.draw
      end
    end

    def move(direction)
      super
      blocks.each do |block|
        block.move(direction)
      end
    end

    private

    def blocks
      [ block_1,
        block_2,
        block_3,
        block_4]
    end

    def initialize_blocks(color)
      @block_1 = Block.new(window, { x: x,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})

      @block_2 = Block.new(window, { x: x+1,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})

      @block_3 = Block.new(window, { x: x+1,
                                     y: y+1,
                                     unit_side: unit_side,
                                     color: color})


      @block_4 = Block.new(window, { x: x+2,
                                     y: y+1,
                                     unit_side: unit_side,
                                     color: color})
    end
  end
end

require_relative 'shape'
require_relative 'block'
module Tetris
  class S_Shape < Shape
    attr_accessor :top_left_block, :bottom_left_block
    attr_accessor :top_right_block, :bottom_right_block

    def initialize(window, config={})
      super
      initialize_blocks(config[:color])
    end

    def height
      3
    end

    def width
      2
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
      [ top_left_block,
        bottom_left_block,
        top_right_block,
        bottom_right_block]
    end

    def initialize_blocks(color)
      @top_left_block = Block.new(window, { x: x,
                                            y: y,
                                            unit_side: unit_side,
                                            color: color})

      @bottom_left_block = Block.new(window, { x: x,
                                            y: y+1,
                                            unit_side: unit_side,
                                            color: color})

      @top_right_block = Block.new(window, { x: x+1,
                                            y: y+1,
                                            unit_side: unit_side,
                                            color: color})

      @bottom_right_block = Block.new(window, { x: x+1,
                                            y: y+2,
                                            unit_side: unit_side,
                                            color: color})
    end
  end
end

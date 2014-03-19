require 'tetris/shape/shape'
require 'tetris/shape/block'
module Tetris
  class Square < Shape
    attr_accessor :block_side
    attr_accessor :top_left_block, :top_right_block
    attr_accessor :bottom_left_block, :bottom_right_block

    def initialize(window, config={})
      super
      @block_side = config[:block_side] || 10
      initialize_blocks
    end

    def height
      2 * block_side
    end

    def width
      2 * block_side
    end

    def draw
      top_left_block.draw
      top_right_block.draw
      bottom_left_block.draw
      bottom_right_block.draw
    end

    private

    def initialize_blocks
      @top_left_block = Block.new(window, { x: x,
                                           y: y,
                                           side_length: block_side,
                                           color: color})

      @top_right_block = Block.new(window, { x: x + block_side,
                                            y: y,
                                            side_length: block_side,
                                            color: color})

      @bottom_left_block = Block.new(window, { x: x,
                                            y: y + block_side,
                                            side_length: block_side,
                                            color: color})

      @bottom_right_block = Block.new(window, { x: x + block_side,
                                            y: y + block_side,
                                            side_length: block_side,
                                            color: color})
    end
  end
end

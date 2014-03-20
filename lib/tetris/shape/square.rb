require_relative 'shape.rb'
require_relative 'block.rb'
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

    def initialize_blocks
      @top_left_block = Block.new(window, { x: x,
                                           y: y,
                                           side_length: block_side,
                                           color: color,
                                           speed: speed })

      @top_right_block = Block.new(window, { x: x + block_side,
                                            y: y,
                                            side_length: block_side,
                                            color: color,
                                            speed: speed })

      @bottom_left_block = Block.new(window, { x: x,
                                            y: y + block_side,
                                            side_length: block_side,
                                            color: color,
                                            speed: speed })

      @bottom_right_block = Block.new(window, { x: x + block_side,
                                            y: y + block_side,
                                            side_length: block_side,
                                            color: color,
                                            speed: speed })
    end

    def blocks
      [ top_left_block,
        top_right_block,
        bottom_left_block,
        bottom_right_block
      ]
    end
  end
end

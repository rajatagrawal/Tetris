require_relative 'shape.rb'
require_relative 'block.rb'
module Tetris
  class Square < Shape
    attr_accessor :top_left_block, :top_right_block
    attr_accessor :bottom_left_block, :bottom_right_block

    def initialize(window, config={})
      super
      initialize_blocks
    end

    def height
      2 * unit_side
    end

    def width
      2 * unit_side
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

    def block_coordinates
      [[top_left_block.x, top_left_block.y],
       [top_right_block.x, top_right_block.y],
       [bottom_left_block.x, bottom_left_block.y],
       [bottom_right_block.x, bottom_right_block.y]]
    end

    private

    def initialize_blocks
      @top_left_block = Block.new(window, { x: x,
                                           y: y,
                                           unit_side: unit_side,
                                           color: color,
                                           speed: speed })

      @top_right_block = Block.new(window, { x: x + unit_side,
                                            y: y,
                                            unit_side: unit_side,
                                            color: color,
                                            speed: speed })

      @bottom_left_block = Block.new(window, { x: x,
                                            y: y + unit_side,
                                            unit_side: unit_side,
                                            color: color,
                                            speed: speed })

      @bottom_right_block = Block.new(window, { x: x + unit_side,
                                            y: y + unit_side,
                                            unit_side: unit_side,
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

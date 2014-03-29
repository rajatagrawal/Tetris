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
      2
    end

    def width
      2
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
      [[x,y],
       [x+1,y],
       [x,y+1],
       [x+1,y+1]]
    end

    private

    def initialize_blocks
      @top_left_block = Block.new(window, { x: x,
                                           y: y,
                                           unit_side: unit_side,
                                           color: color})

      @top_right_block = Block.new(window, { x: x + 1,
                                            y: y,
                                            unit_side: unit_side,
                                            color: color})

      @bottom_left_block = Block.new(window, { x: x,
                                            y: y + 1,
                                            unit_side: unit_side,
                                            color: color})

      @bottom_right_block = Block.new(window, { x: x + 1,
                                            y: y + 1,
                                            unit_side: unit_side,
                                            color: color})
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

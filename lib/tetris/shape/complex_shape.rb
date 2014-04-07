require_relative 'shape'
require_relative 'block'

module Tetris
  class ComplexShape < Shape

    attr_accessor :block_1, :block_2
    attr_accessor :block_3, :block_4

    def initialize(window, config={})
      super
      initialize_blocks(config[:color])

    end

    def block_coordinates
      blocks.map do |block|
        [block.x, block.y, block.color]
      end
    end

    def height
      coordinates = blocks.map(&:y).minmax
      coordinates[1] - coordinates[0] + 1
    end

    def width
      coordinates = blocks.map(&:x).minmax
      coordinates[1] - coordinates[0] + 1
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

      @block_2 = Block.new(window, { x: x,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})

      @block_3 = Block.new(window, { x: x,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})


      @block_4 = Block.new(window, { x: x,
                                     y: y,
                                     unit_side: unit_side,
                                     color: color})
    end
  end
end

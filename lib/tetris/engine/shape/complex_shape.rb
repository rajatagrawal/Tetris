require 'block'

module Tetris
  class ComplexShape

    attr_accessor :x, :y, :color
    attr_accessor :unit_side, :orientation

    def initialize(config={})
      assign_config config
      initialize_blocks(config[:color])
    end

    def coordinates
      blocks.map do |block|
        [block.x, block.y, block.color]
      end
    end

    def coordinates=(coordinates)
      blocks.map!.with_index do |block, index|
        block.x, block.y = coordinates[index]
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

    def move(direction)
      move_piece direction
      blocks.cycle(1) { |block| block.move(direction) }
    end

    def rotate
      case orientation
      when '0_degrees'
        coordinates = rotated_coordinates '90_degrees'
        rotated_block = rotated_block_coordinates '90_degrees'
        self.orientation = '90_degrees'
      when '90_degrees'
        coordinates = rotated_coordinates '180_degrees'
        rotated_block = rotated_block_coordinates '180_degrees'
        self.orientation = '180_degrees'
      when '180_degrees'
        coordinates = rotated_coordinates '270_degrees'
        rotated_block = rotated_block_coordinates '270_degrees'
        self.orientation = '270_degrees'
      when '270_degrees'
        coordinates = rotated_coordinates '0_degrees'
        rotated_block = rotated_block_coordinates '0_degrees'
        self.orientation = '0_degrees'
      end

      @x, @y = coordinates
      self.coordinates = rotated_block
    end


    def blocks
      [ @block_1, @block_2,
        @block_3, @block_4]
    end

    private

    def assign_config config
      @x = config[:x] || 1
      @y = config[:y] || 1
      @color = config[:color]
      @unit_side = config[:unit_side] || 10
      @orientation = config[:orientation] || '0_degrees'
    end

    def initialize_blocks(color)
      @block_1 = Block.new({ x: x, y: y,
                             unit_side: unit_side,
                             color: color})

      @block_2 = Block.new({ x: x, y: y,
                             unit_side: unit_side,
                             color: color})

      @block_3 = Block.new({ x: x, y: y,
                             unit_side: unit_side,
                             color: color})


      @block_4 = Block.new({ x: x, y: y,
                             unit_side: unit_side,
                             color: color})
    end

    def move_piece(direction)
      case direction
      when 'down'
        @y+= 1
      when 'up'
        @y -= 1
      when 'right'
        @x += 1
      when 'left'
        @x -= 1
      end
    end
  end
end

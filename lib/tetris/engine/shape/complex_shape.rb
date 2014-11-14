require 'tetris/engine/shape/block'

module Tetris
  class ComplexShape


    DEGREES_0 = '0_degrees'
    DEGREES_90 = '90_degrees'
    DEGREES_180 = '180_degrees'
    DEGREES_270 = '270_degrees'

    ORIENTATIONS = [DEGREES_0,
                    DEGREES_90,
                    DEGREES_180,
                    DEGREES_270]

    attr_reader :blocks
    attr_accessor :x, :y, :color
    attr_accessor :unit_side, :orientation

    def initialize(config={})
      assign_config config
      initialize_blocks config[:color]
    end

    def coordinates
      @blocks.map { |block| [block.x, block.y] }
    end

    def coordinates=(coordinates)
      @blocks.each_with_index do |block, index|
        block.x, block.y = coordinates[index]
      end
    end

    def height
      coordinates = @blocks.map(&:y).minmax
      coordinates[1] - coordinates[0] + 1
    end

    def width
      coordinates = @blocks.map(&:x).minmax
      coordinates[1] - coordinates[0] + 1
    end

    def move(direction)
      move_piece direction
      @blocks.each { |block| block.move(direction) }
    end

    def next_orientation
      index = ORIENTATIONS.index orientation
      ORIENTATIONS.rotate(index+1).first
    end

    def rotate
      @orientation = next_orientation
      self.coordinates = coordinates_for(@orientation)
    end

    private

    def assign_config config
      @x = config[:x] || 1
      @y = config[:y] || 1
      @color = config[:color]
      @unit_side = config[:unit_side] || 10
      @orientation = config[:orientation] || ORIENTATIONS.first
    end

    def initialize_blocks(color)
      @blocks = Array.new(4) do
                  Block.new({ unit_side: unit_side,
                              color: color})
      end
      self.coordinates = coordinates_for @orientation
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

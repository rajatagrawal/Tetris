require_relative './shape/block.rb'
require_relative './shape/square.rb'

module Tetris
  class GameStrategy

    attr_accessor :window
    attr_accessor :unit_length
    attr_accessor :height, :width
    attr_accessor :shapes

    def initialize(window, config={})
      @window = window
      @unit_length = config[:unit_length] || 10
      @width = assign_width(config[:width])
      @height = assign_height(config[:height])
      @shapes = []
    end

    def generate_shape
      if shapes.size == 0 || shapes[-1].y >= height
        shapes << [Square, Block].sample.new(window)
      end
    end

    def move_shape(direction)
      shape = shapes[-1]
      if direction == 'left' && shape.x > 0
        shape.move(direction)
      elsif direction == 'right' && shape.right_edge < width
        shape.move(direction)
      elsif direction == 'down' && space_to_move?(shape)
        shape.move(direction)
      end
    end

    private

    def space_to_move?(shape)
      true
    end

    def assign_width(width)
      width ? (width/unit_length) * unit_length : 20 * unit_length
    end

    def assign_height(height)
      height ? (height/unit_length) * unit_length : 40 * unit_length
    end
  end
end

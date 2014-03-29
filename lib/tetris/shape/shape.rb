module Tetris
  class Shape
    attr_accessor :x, :y, :color, :window, :unit_side

    def initialize(window, config={})
      @window = window
      @x = config[:x] || 1
      @y = config[:y] || 1
      @color = config[:color] || Gosu::Color::RED
      @unit_side = config[:unit_side] || 10
    end

    def height
      0
    end

    def width
      0
    end

    def right_edge
      x + width
    end

    def bottom_edge
      y + height
    end

    def draw
    end

    def block_coordinates
      []
    end

    def move(direction)
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

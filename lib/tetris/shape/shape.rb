module Tetris
  class Shape
    attr_accessor :x, :y, :color, :window, :speed, :unit_side

    def initialize(window, config={})
      @window = window
      @x = config[:x] || 0
      @y = config[:y] || 0
      @speed = config[:speed] || 5
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
        @y+= speed
      when 'up'
        @y -= speed
      when 'right'
        @x += speed
      when 'left'
        @x -= speed
      end
    end
  end
end

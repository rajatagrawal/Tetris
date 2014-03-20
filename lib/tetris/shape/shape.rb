module Tetris
  class Shape
    attr_accessor :x, :y, :color, :window, :speed

    def initialize(window, config={})
      @window = window
      @x = config[:x] || 0
      @y = config[:y] || 0
      @speed = config[:speed] || 5
      @color = config[:color] || Gosu::Color::RED
    end

    def height
      0
    end

    def width
      0
    end

    def draw
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

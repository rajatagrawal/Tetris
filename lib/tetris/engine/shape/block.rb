module Tetris
  class Block

    attr_accessor :x, :y, :color
    attr_accessor :unit_side

    def initialize(config={})
      @x = config[:x] || 1
      @y = config[:y] || 1
      @color = config[:color]
      @unit_side = config[:unit_side] || 10
    end

    def height
      1
    end

    def width
      1
    end

    def block_coordinates
      [[x,y, color]]
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

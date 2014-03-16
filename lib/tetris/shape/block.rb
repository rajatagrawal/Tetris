module Tetris
  class Block

    attr_accessor :window, :x, :y, :width, :height, :color

    def initialize(gosu_window, config={})
      @window = gosu_window
      @x = config[:x] || 0
      @y = config[:y] || 0
      @width = config[:width] || 10
      @height = config[:height] || 10
      @color = config[:color] || Gosu::Color::RED
    end

    def draw
      @window.draw_quad(x,y,color,
                        x+width, y, color,
                        x+width, y+height, color,
                        x, y+height, color)
    end
  end
end

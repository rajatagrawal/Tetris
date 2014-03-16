module Tetris
  class Block

    attr_accessor :window, :x, :y, :width, :height, :color

    def initialize(gosu_window,
                   x =0,
                   y=0,
                   width=10,
                   height=10,
                   color=Gosu::Color::RED)
      @window = gosu_window
      @x = x
      @y = y
      @width = width
      @height = height
      @color = color
    end

    def draw
      @window.draw_quad(x,y,color,
                        x+width, y, color,
                        x+width, y+height, color,
                        x, y+height, color)
    end
  end
end

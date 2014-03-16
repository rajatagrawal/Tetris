module Tetris
  class Shape
    attr_accessor :x, :y, :color

    def initialize(window, x=0, y=0, color=Gosu::Color::RED)
      @x = x
      @y = y
      @color = color
    end
  end
end

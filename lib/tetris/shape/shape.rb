module Tetris
  class Shape
    attr_accessor :x, :y, :color

    def initialize(window, config={})
      @x = config[:x] || 0
      @y = config[:y] || 0
      @color = config[:color] || Gosu::Color::RED
    end
  end
end

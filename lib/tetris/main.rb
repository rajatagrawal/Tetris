require 'gosu'
require_relative 'game_strategy/main'

module Tetris
  class GameWindow < Gosu::Window

    def initialize
      super(1280,1080,false)
      self.caption=('Tetris')
      config = { width: 6,
                 height: 20,
                 unit_side: 40 }
      @game_strategy = GameStrategy::Main.new(self, config)
    end

    def update
      sleep(0.1)
      @game_strategy.run_game
    end

    def draw
      @game_strategy.shapes.each do |shape|
        shape.draw
      end
    end
  end
end
game = Tetris::GameWindow.new
game.show

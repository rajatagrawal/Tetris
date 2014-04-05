require 'gosu'
require_relative 'game_strategy/main'
require_relative 'input_output/keyboard'

module Tetris
  class GameWindow < Gosu::Window
    include InputOutput::Keyboard

    def initialize
      super(1280,1080,false)
      self.caption=('Tetris')
      config = { width: 6,
                 height: 20,
                 unit_side: 40 }
      @game_strategy = GameStrategy::Main.new(self, config)
    end

    def update
      keyboard_listener
      sleep(0.1)
      @game_strategy.run_game
    end

    def draw
      @game_strategy.shape.draw
      @game_strategy.draw_map
      @game_strategy.show_score
    end
  end
end
game = Tetris::GameWindow.new
game.show

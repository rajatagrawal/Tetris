require 'gosu'
require_relative 'game_strategy/main'
require_relative 'input/keyboard'

module Tetris
  class GameWindow < Gosu::Window

    def initialize
      super(1280,1080,false, 1)
      self.caption=('Tetris')
      config = { width: 10,
                 height: 20,
                 unit_side: 40 }
      @game_strategy = GameStrategy::Main.new(self, config)
      @keyboard = Input::Keyboard.new(self, @game_strategy, 5)
      @counter = 0
      @time_interval = 17
    end

    def update
      @keyboard.listener

      if (@counter % @time_interval) == 0
        @counter = 0
        @game_strategy.run_game
      end
      @counter +=1
    end

    def draw
      @game_strategy.game_screen.draw_screen
    end

    def button_up(id)
      @keyboard.reset_ticker
    end
  end
end

game = Tetris::GameWindow.new
game.show

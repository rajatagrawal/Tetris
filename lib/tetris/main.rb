require 'gosu'
require_relative 'game_strategy/main'
require_relative 'input_output/keyboard'

module Tetris
  class GameWindow < Gosu::Window
    include InputOutput::Keyboard

    def initialize
      super(1280,1080,false, 1)
      self.caption=('Tetris')
      config = { width: 10,
                 height: 20,
                 unit_side: 40 }
      @game_strategy = GameStrategy::Main.new(self, config)
      @counter = 0
      @time_interval = 17
      @keyboard_interval = 5
      @keyboard_press_interval = 5
      @keyboard_press = 0
    end

    def update
      keyboard_listener

      if (@counter % @time_interval) == 0
        @counter = 0
        @game_strategy.run_game
      end
      @counter +=1
    end

    def draw
      @game_strategy.player.shape.draw
      @game_strategy.draw_map
      @game_strategy.show_score
    end

    def button_up(id)
      @keyboard_press = 0
    end
  end
end
game = Tetris::GameWindow.new
game.show

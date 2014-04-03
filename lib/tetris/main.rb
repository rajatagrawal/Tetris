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
      sleep(0.1)
      @game_strategy.run_game
    end

    def button_down(id)
      keyboard_listener(id)
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

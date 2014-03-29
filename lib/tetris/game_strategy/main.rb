require_relative 'window'
require_relative 'movement'
require_relative 'game_control'

module Tetris
  module GameStrategy
    class Main
      include Window
      include Movement
      include GameControl
    end
  end
end

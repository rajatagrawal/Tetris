require_relative 'window'
require_relative 'movement'
require_relative 'game_control'
require_relative 'squeeze'
require_relative 'tetris_map'

module Tetris
  module GameStrategy
    class Main
      include Window
      include Movement
      include GameControl
      include Squeeze
      include TetrisMap
    end
  end
end

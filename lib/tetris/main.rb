require 'gosu'

module Tetris
  class GameWindow < Gosu::Window
    def initialize
      super(1280,1080,false)
      self.caption=('Tetris')
    end
  end
end

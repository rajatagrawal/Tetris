dirname = File.expand_path File.dirname __FILE__
$LOAD_PATH.unshift(dirname) unless $LOAD_PATH.include?(dirname)

require 'gosu'
require 'engine/main'
require 'ui/game_screen'
require 'input/keyboard/manager'
require 'output/background_music'

module Tetris
  class GameWindow < Gosu::Window

    def initialize
      super(1280,1080,false, 1)
      self.caption=('Tetris')
      config = { window: self,
                 width: 20,
                 height: 20,
                 speed: 17,
                 unit_side: 40,
                 players: 3}
      @game_engine = Engine::Main.new config
      @keyboard = Input::Keyboard::Manager.new(self, @game_engine, 5)
      @counter = 0
      @game_screen = UI::GameScreen.new({context: self,
                                         players: @game_engine.players,
                                         tetris_map: @game_engine.grid})

      @background_music = Output::BackgroundMusic.new(self,
                                                      './assets/tetris_music.mp3')
      @background_music.play_music
    end

    def update
      @keyboard.listener

      if (@counter % @game_engine.speed) == 0
        @counter = 0
        @game_engine.run_game
      end
      @counter +=1
    end

    def draw
      @game_screen.draw_screen
    end

    def button_up(key)
      @keyboard.reset_ticker key
    end
  end
end

game = Tetris::GameWindow.new
game.show

module Tetris
  module InputOutput
    module Keyboard

      def keyboard_listener
        if button_down? Gosu::KbLeft
            @game_strategy.move_shape 'left'
        elsif button_down? Gosu::KbRight
          @game_strategy.move_shape 'right'
        elsif button_down? Gosu::KbDown
          @game_strategy.move_shape 'down'
        end
      end
    end
  end
end

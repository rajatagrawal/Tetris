module Tetris
  module InputOutput
    module Keyboard

      def keyboard_listener(id)
        if id == Gosu::KbLeft
            @game_strategy.move_shape 'left'
        elsif id == Gosu::KbRight
          @game_strategy.move_shape 'right'
        end
      end
    end
  end
end

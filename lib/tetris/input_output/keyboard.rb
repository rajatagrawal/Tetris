module Tetris
  module InputOutput
    module Keyboard

      def keyboard_listener
        if button_down? Gosu::KbLeft
          if (@keyboard_press % @keyboard_press_interval) == 0
            @game_strategy.move_shape 'left'
          end
          @keyboard_press +=1
        elsif button_down? Gosu::KbRight
          if (@keyboard_press % @keyboard_press_interval) == 0
            @game_strategy.move_shape 'right'
          end
          @keyboard_press +=1
        elsif button_down? Gosu::KbDown
          if (@keyboard_press % @keyboard_press_interval) == 0
            @game_strategy.move_shape 'down'
          end
          @keyboard_press +=1
        elsif button_down? Gosu::KbUp
          if (@keyboard_press % (@keyboard_press_interval+5)) == 0
            @game_strategy.rotate_shape
          end
          @keyboard_press +=1
        end
      end
    end
  end
end

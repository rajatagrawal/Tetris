module Tetris
  module InputOutput
    module Keyboard

      def keyboard_listener
        if button_down? Gosu::KbLeft
          if (@keyboard_press % @keyboard_press_interval) == 0
            @game_strategy.movement_handler.move_shape('left',
                                                       @game_strategy.player.shape)
          end
          @keyboard_press +=1
        elsif button_down? Gosu::KbRight
          if (@keyboard_press % @keyboard_press_interval) == 0
            @game_strategy.movement_handler.move_shape('right',
                                                       @game_strategy.player.shape)
          end
          @keyboard_press +=1
        elsif button_down? Gosu::KbDown
          if (@keyboard_press % @keyboard_press_interval) == 0
            @game_strategy.movement_handler.move_shape('down',
                                                       @game_strategy.player.shape)
          end
          @keyboard_press +=1
        elsif button_down? Gosu::KbUp
          if (@keyboard_press % (@keyboard_press_interval+5)) == 0
            @game_strategy.rotation_handler.rotate_shape @game_strategy.player.shape
          end
          @keyboard_press +=1
        elsif button_down? Gosu::KbSpace
          if (@keyboard_press % (@keyboard_press_interval + 5)) == 0
            @game_strategy.movement_handler.drop_shape @game_strategy.player.shape
          end
          @keyboard_press += 1
        end
      end
    end
  end
end

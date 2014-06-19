module Tetris
  module Input
    class Keyboard

      def initialize(window, game_engine, responsiveness)
        @window = window
        @game_engine = game_engine
        @responsiveness = responsiveness
        @rotation_responsiveness = @responsiveness + 5
        @ticker = 0
      end

      def reset_ticker
        @ticker = 0
      end

      def listener
        movement_handler = @game_engine.movement_handler
        rotation_handler = @game_engine.rotation_handler
        shape = @game_engine.player.shape

        if @window.button_down? Gosu::KbLeft
          movement_handler.move_shape('left', shape) if time_to_move?
          @ticker +=1
        elsif @window.button_down? Gosu::KbRight
          movement_handler.move_shape('right', shape) if time_to_move?
          @ticker +=1
        elsif @window.button_down? Gosu::KbDown
          movement_handler.move_shape('down', shape) if time_to_move?
          @ticker +=1
        elsif @window.button_down? Gosu::KbUp
          rotation_handler.rotate_shape shape if time_to_rotate?
          @ticker +=1
        elsif @window.button_down? Gosu::KbSpace
          movement_handler.drop_shape shape if time_to_rotate?
          @ticker +=1
        end
      end

      private

      def time_to_move?
        (@ticker % @responsiveness) == 0
      end

      def time_to_rotate?
        (@ticker % @rotation_responsiveness) == 0
      end
    end
  end
end

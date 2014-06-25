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
        player1_shape = @game_engine.players.first.shape
        player2_shape = @game_engine.players.last.shape
        player1_listener(player1_shape, player2_shape, movement_handler, rotation_handler)
        player2_listener(player2_shape, player1_shape, movement_handler, rotation_handler)
      end

      private

      def player1_listener(shape, other_shape, movement_handler, rotation_handler)
        if @window.button_down? Gosu::KbLeft
          movement_handler.move_shape('left', shape, other_shape) if time_to_move?
          @ticker +=1
        elsif @window.button_down? Gosu::KbRight
          movement_handler.move_shape('right', shape, other_shape) if time_to_move?
          @ticker +=1
        elsif @window.button_down? Gosu::KbDown
          movement_handler.move_shape('down', shape, other_shape) if time_to_move?
          @ticker +=1
        elsif @window.button_down? Gosu::KbUp
          rotation_handler.rotate_shape shape if time_to_rotate?
          @ticker +=1
        elsif @window.button_down? Gosu::KbSpace
          movement_handler.drop_shape(shape, other_shape)if time_to_rotate?
          @ticker +=1
        end
      end

      def player2_listener(shape, other_shape, movement_handler, rotation_handler)
        if @window.button_down? Gosu::KbA
          movement_handler.move_shape('left', shape, other_shape) if time_to_move?
          @ticker +=1
        elsif @window.button_down? Gosu::KbD
          movement_handler.move_shape('right', shape, other_shape) if time_to_move?
          @ticker +=1
        elsif @window.button_down? Gosu::KbS
          movement_handler.move_shape('down', shape, other_shape) if time_to_move?
          @ticker +=1
        elsif @window.button_down? Gosu::KbW
          rotation_handler.rotate_shape shape if time_to_rotate?
          @ticker +=1
        elsif @window.button_down? Gosu::KbLeftShift
          movement_handler.drop_shape(shape, other_shape) if time_to_rotate?
          @ticker +=1
        end
      end

      def time_to_move?
        (@ticker % @responsiveness) == 0
      end

      def time_to_rotate?
        (@ticker % @rotation_responsiveness) == 0
      end
    end
  end
end

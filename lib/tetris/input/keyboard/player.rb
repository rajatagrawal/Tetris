module Tetris
  module Input
    module Keyboard
      class Player

        def initialize(config)
          assign_config config
          @movement = @game_engine.movement
          @rotation = @game_engine.rotation
          @rotation_responsiveness = @responsiveness + 5
          @ticker = 0
        end

        def reset_ticker
          @ticker = 0
        end

        def listener(shape, other_shape)
          keyboard_actor(shape, other_shape)
        end

        private

        def assign_config(config)
          @window = config[:window]
          @game_engine = config[:game_engine]
          @responsiveness = config[:responsiveness]
          @keys_config = config[:keys_config]
        end

        def keyboard_actor(shape, other_shape)
          if @window.button_down? @keys_config[:left]
            @movement.move_shape('left', shape, [other_shape]) if time_to_move?
            @ticker +=1
          elsif @window.button_down? @keys_config[:right]
            @movement.move_shape('right', shape, [other_shape]) if time_to_move?
            @ticker +=1
          elsif @window.button_down? @keys_config[:down]
            @movement.move_shape('down', shape, [other_shape]) if time_to_move?
            @ticker +=1
          elsif @window.button_down? @keys_config[:rotate]
            @rotation.rotate_shape(shape, other_shape) if time_to_rotate?
            @ticker +=1
          elsif @window.button_down? @keys_config[:drop]
            @movement.drop_shape(shape, [other_shape])if time_to_rotate?
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
end

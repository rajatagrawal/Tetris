module Tetris
  module Input
    module Keyboard
      class Player

        attr_reader :keys_config

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

        def listener
          keyboard_actor
        end

        private

        def assign_config(config)
          @window = config[:window]
          @game_engine = config[:game_engine]
          @responsiveness = config[:responsiveness]
          @keys_config = config[:keys_config]
          @player = config[:player]
        end

        def keyboard_actor
          key_for = button_pressed

          case key_for
          when 'left'
            @movement.move_shape(@player, 'left') if time_to_move?
          when 'right'
            @movement.move_shape(@player, 'right') if time_to_move?
          when 'down'
            @movement.move_shape(@player, 'down') if time_to_move?
          when 'rotate'
            @rotation.rotate_shape(@player) if time_to_rotate?
          when 'drop'
            @movement.drop_shape(@player) if time_to_rotate?
          end

          @ticker +=1 if key_for
        end

        def button_pressed
          if @window.button_down? @keys_config[:left]
            'left'
          elsif @window.button_down? @keys_config[:right]
            'right'
          elsif @window.button_down? @keys_config[:down]
            'down'
          elsif @window.button_down? @keys_config[:rotate]
            'rotate'
          elsif @window.button_down? @keys_config[:drop]
            'drop'
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

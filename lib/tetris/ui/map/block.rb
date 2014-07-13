require 'color_parser'

module Tetris
  module UI
    module Map
      class Block

        def initialize(canvas, config)
          @canvas = canvas
          assign_config config

          @red_color = Gosu::Image.new(@canvas,
                                       ColorParser.parse_file_name('red'),
                                       false)

          @blue_color = Gosu::Image.new(@canvas,
                                        ColorParser.parse_file_name('blue'),
                                        false)

          @default_color = Gosu::Image.new(@canvas,
                                           ColorParser.parse_file_name('none'),
                                           false)
        end

        def draw(color)
          scaling_factor = @length / @red_color.height.to_f
          case color
          when 'red'
            @red_color.draw(@x, @y, 0, scaling_factor, scaling_factor)
          when 'blue'
            @blue_color.draw(@x, @y, 0, scaling_factor, scaling_factor)
          when 'none'
            @default_color.draw(@x, @y, 0, scaling_factor, scaling_factor)
          end
        end

        private

        def assign_config(config)
          @x = config[:x]
          @y = config[:y]
          @length = config[:length]
        end
      end
    end
  end
end

require 'map/block'

module Tetris
  module UI
    module Map
      class Map

        def initialize(config)
          initializations config
          map_initialization
        end

        def draw
          draw_map
        end

        private

        def initializations(config)
          @tetris_map = config[:tetris_map]
          @canvas = config[:canvas]
          @width = @tetris_map.width
          @height = @tetris_map.height
          @side = @tetris_map.unit_side
        end

        def map_initialization
          @map = Array.new(@height) do |y|
            Array.new(@width) do |x|
              Block.new(@canvas, config(x,y))
            end
          end
        end

        def config(x,y)
          { x: (x+1) * @side,
            y: (y+1) * @side,
            length: @side }
        end

        def [](x,y)
          @map[y-1][x-1]
        end

        def draw_map
          cross_product.each { |x,y| self[x,y].draw(@tetris_map[x,y]) }
        end

        def cross_product
          widths = (1..@width).to_a
          heights = (1..@height).to_a

          widths.product heights
        end
      end
    end
  end
end

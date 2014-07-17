dirname = File.expand_path File.dirname __FILE__
$LOAD_PATH.unshift(dirname) unless $LOAD_PATH.include? dirname

require 'font/font'
require 'map/map'
require 'shape/piece'

module Tetris
  module UI
    class GameScreen

      def initialize(config)
        initializations config
      end

      def draw_screen
        draw_player_information
        draw_map
        draw_current_shape
      end

      private

      def initializations(config)
        @context = config[:context]
        @players = config[:players]
        @font = Font::Font.new(@context)

        @map = Map::Map.new({ canvas: @context,
                             tetris_map: config[:tetris_map] })
      end

      def draw_player_information
        @players.each do |player|
          offset = (400 * player.number) + 40
          @font.draw("Player #{player.number + 1}",900,offset,0)
          @font.draw("Score : #{player.score}", 900, offset + 40, 0)
          @font.draw("Next Shape", 900, offset + 80, 0)
          draw_next_shape(900, offset + 120, player)
        end
      end

      def draw_map
        @map.draw
      end

      def draw_current_shape
        @players.each do |player|
          Shape::Piece.new(@context, player.shape).draw
        end
      end

      def draw_next_shape(x,y, player)
        shape = player.next_shape
        x = x - ( shape.x * shape.unit_side)
        y = y - ( shape.y * shape.unit_side)
        @context.translate(x, y) do
          Shape::Piece.new(@context, player.next_shape).draw
        end
      end
    end
  end
end

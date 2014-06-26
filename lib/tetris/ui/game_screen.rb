require_relative 'map/map_renderer'
require_relative 'shape/piece'
module Tetris
  module UI
    class GameScreen

      def initialize(window, tetris_map, players)
        @window = window
        @players = players
        @score_font = Gosu::Font.new(@window, 'Arial', 30)
        config = { canvas: @window,
                   tetris_map: tetris_map }
        @map_renderer = Map::MapRenderer.new(config)
      end

      def draw_screen
        draw_player_information
        draw_map
        draw_current_shape
      end

      private

      def draw_player_information
        @players.each.with_index do |player, index|
          offset = (400 * index) + 40
          @score_font.draw("Player #{index + 1}",900,offset,0)
          @score_font.draw("Score : #{player.score}", 900, offset + 40, 0)
          @score_font.draw("Next Shape", 900, offset + 80, 0)
          draw_next_shape(900, offset + 120, player)
        end
      end

      def draw_map
        @map_renderer.draw_map
      end

      def draw_current_shape
        @players.each do |player|
          Shape::Piece.new(@window, player.shape).draw
        end
      end

      def draw_next_shape(x,y, player)
        shape = player.next_shape
        x = x - ( shape.x * shape.unit_side)
        y = y - ( shape.y * shape.unit_side)
        @window.translate(x, y) do
          Shape::Piece.new(@window, player.next_shape).draw
        end
      end
    end
  end
end

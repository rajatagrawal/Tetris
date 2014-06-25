require_relative 'map_renderer'
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
        @map_renderer = MapRenderer.new(config)
      end

      def draw_screen
        draw_map
        draw_score
        draw_current_shape
        draw_next_shape
      end

      private

      def draw_map
        @map_renderer.draw_map
      end

      def draw_score
        @players.each.with_index do |player, index|
          @score_font.draw("Score : #{player.score}",0,100 * index,0)
        end
      end

      def draw_current_shape
        @players.each do |player|
          Shape::Piece.new(@window, player.shape).draw
        end
      end

      def draw_next_shape
        @window.translate(440, 0) do
          @players.each.with_index do |player, index|
            @score_font.draw('Next Shape', 200,300 * index,0)
            @window.translate(0,350 * index) do
              Shape::Piece.new(@window, player.next_shape).draw
            end
          end
        end
      end
    end
  end
end

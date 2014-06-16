require_relative 'map_renderer'
module Tetris
  module UI
    class GameScreen

      def initialize(window, tetris_map, player)
        @window = window
        @player = player
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
        @score_font.draw("Score : #{@player.score}",0,0,0)
      end

      def draw_current_shape
        @player.shape.draw
      end

      def draw_next_shape
        @window.translate(440, 0) do
          @score_font.draw('Next Shape', 200,0,0)
          @window.translate(0,50) do
            @player.next_shape.draw
          end
        end
      end
    end
  end
end

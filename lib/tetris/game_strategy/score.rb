module Tetris
  module GameStrategy
    module Score

      def increase_score(score)
        @score += score
      end

      def show_score
        score_font.draw("Score : #{@player.score}",0,0,0)
      end
    end
  end
end

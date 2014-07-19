module Tetris
  module Engine
    module Handlers
      class Score

        @@score_per_row = 20

        def self.increase_score(player, row_count)
          player.increase_score(increase(row_count))
        end

        def self.increase(row_count)
          @@score_per_row * row_count
        end
        private_class_method  :increase

      end
    end
  end
end

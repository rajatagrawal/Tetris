require 'tetris/engine/handlers/score'

module Tetris
  module Engine
    module Handlers
      describe Score do
        it 'increases the player score for no of rows' do
          player = double(:player)
          expect(player).to receive(:increase_score).
            with(80)
          Score.increase_score(player, 4)
        end
      end
    end
  end
end

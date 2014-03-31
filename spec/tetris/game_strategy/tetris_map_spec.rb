require 'spec_helper'
require 'tetris/game_strategy/tetris_map'

module Tetris
  module GameStrategy
    class TestTetrisMap
      include Window
      include GameControl
      include TetrisMap
    end

    describe TestTetrisMap do
      let(:window) { double 'window' }
      describe '#draw_block' do
        it 'draws a block of tetris map' do
          config = { unit_side: 10 }
          game_strategy = described_class.new(window, config)
          color = Gosu::Color::NONE
          expect(game_strategy.window).to receive(:draw_quad)
          .with(10,10, color,
                20, 10, color,
                20, 20, color,
                10, 20, color)
          game_strategy.draw_block(1,1)
        end

        describe '#draw_map' do
          it 'draws every block of the map' do
            config = { height: 2, width: 2}
            game_strategy = described_class.new(window, config)
            expect(game_strategy).to receive(:draw_block).with(1,1)
            expect(game_strategy).to receive(:draw_block).with(1,2)
            expect(game_strategy).to receive(:draw_block).with(2,1)
            expect(game_strategy).to receive(:draw_block).with(2,2)
            game_strategy.draw_map
          end
        end
      end
    end
  end
end

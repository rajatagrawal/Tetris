require 'tetris/engine/main'
module Tetris
  module Engine
    describe Main do
      let(:config) { {  height: 10,
                        width: 10,
                        unit_side: 35,
                        speed: 10,
                        players: 2} }

      describe '#run_game' do
        let(:main_game) { Main.new config }

        xit 'moves the shape down' do
          main_game.players.each do |player|
            expect(player.shape).to receive(:move).with('down')
          end
          main_game.run_game
        end

        context 'when the shape cannot move down' do
          before do
            allow(main_game.movement).to receive(:move_shape).and_return(false)
          end
          xit 'freezes the shape' do
            expect_any_instance_of(Handlers::Freeze).to receive(:freeze_shape).twice
            main_game.run_game
          end

          xit 'squeezes the rows' do
            expect_any_instance_of(Handlers::Squeeze).to receive(:squeeze_rows).twice
            allow{main_game.run_game}.to_not raise_error
          end

          xit 'increases the score by no of squeezed rows' do
            expect(Handlers::Score).to receive(:increase_score).
              with(main_game.players.first, anything)
            expect(Handlers::Score).to receive(:increase_score).
              with(main_game.players.last, anything)
            main_game.run_game
          end

          context 'if there is space for new shape' do
            it 'generates a new shape' do
              allow(main_game.grid).to receive(:has_space_for?).and_return(true)
              expect_any_instance_of(Handlers::Shape::Shape).to receive(:new_shape).twice
              main_game.run_game
            end
          end

          context 'if there is not enough space for a new shape' do
            it 'raise game over exception' do
              allow(main_game.grid).to receive(:has_space_for?).and_return(false)
              expect{ main_game.run_game }.to raise_error 'game over'
            end
          end
        end
      end
    end
  end
end
